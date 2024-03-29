##' Retrieve Data From the Reserve Bank of New Zealand Website
##'
##' Retrieves data from \url{https://www.rbnz.govt.nz/statistics} for the series
##' specified by the user.  This involves downloading one or more spreadsheets
##' and reading them into R.
##'
##' @param series Character string giving the name of the data series to retrieve.
##' @param option Character string specifying which format of the data series
##' to retrieve, if necessary.  For information on the available options
##' see the help file for the particular series name (for example ?B1
##' will tell you that the B1 series can be downloaded either as daily
##' or monthly data, with the former being the default).  This argument
##' is unnecessary for series that only have one data format.
##' @param replaceColumnNames Logical indicating whether to change the column names of
##' the output data from the Series ID's used in the source
##' spreadsheets to more informative values based on the
##' information in the metadata. Defaults to TRUE.
##' @param fieldForColumnNames If replaceColumnNames is TRUE then this variable
##' specifies which columns of the meta data file will be
##' used to construct the column names.  Defaults to
##' \dQuote{Series} but sometimes you may want to change
##' it to \dQuote{Group} or c(\dQuote{Group},
##' \dQuote{Series}).  \dQuote{SeriesID} is also allowed.
##' @param reloadOnlyLatest Logical indicated whether to skip downloading files containing
##' past data (with a defined endpoint) if they already exist. For example if a series has
##' separate spreadsheets for start-to-2015 and 2015-onwards then we don't need to repeatedly
##' download the former item; only the latter one will be updated.
##' @param cacheOnly Logical indicating that the RBNZ website should not be read and
##' the files only loaded from an existing cache on disk.
##' @param destDir File path to a directory in which to place the downloaded
##' spreadsheets. If not specified the value of getOption("RBNZ.destDir") will
##' be checked. If that is NULL too then the files will be placed into tempdir()
##' and deleted on exit.
##' @param quiet Logical to be passed to utils::download.file.
##' @param wait Numeric giving the number of seconds to wait between downloads.
##' Defaults to 60. Note that this applies to reading the series page
##' and to each individual spreadsheet download, so a series with one
##' spreadsheet would have two downloads sixty seconds apart.
##'
##' @return For most series a list containing the fields \dQuote{meta} and
##' \dQuote{data} which are data frames containing the metadata and
##' actual data, respectively.  There are a few series that do not follow
##' this format, and for these the spreadsheets are just downloaded and
##' read into a list of data frames, one for each sheet, with no organising
##' or cleaning.
##'
##' @author Jasper Watson
##'
##' @examples
##'
##' ## List the available data series.
##' print(allAvailableSeries())
##'
##' \dontrun{
##'
##' ## Download exchange rate data and plot NZD vs sterling.
##' b1 <- getSeries('B1')
##' plot(b1$data$Date, b1$data$UK_pound_sterling, type = 'l')
##'
##' ## Now use monthly data (previous was daily).
##' b1_monthly <- getSeries('B1', 'monthly')
##' plot(b1_monthly$data$Date, b1_monthly$data$UK_pound_sterling,
##' type = 'l')
##'
##' }
##' @export
##'
##
getSeries <- function(series,
                      option = getDefaultOption(series),
                      replaceColumnNames = TRUE,
                      fieldForColumnNames = "Series",
                      reloadOnlyLatest = TRUE,
                      cacheOnly = FALSE,
                      destDir = NULL,
                      quiet = TRUE,
                      wait = 60
                      ) {

    if (is.null(destDir)) {

        if (is.null(getOption("RBNZ.destDir"))) {

            destDir <- tempdir()
            deleteFiles <- TRUE
        } else {
            destDir <- getOption("RBNZ.destDir")
            deleteFiles <- FALSE
        }
    } else {
        deleteFiles <- FALSE
    }

    stopifnot(series %in% allAvailableSeries(),
              length(series) == 1,
              length(option) == 1,
              option %in% allowedOptions(series),
              fieldForColumnNames %in% c("Group", "Series", "SeriesID"),
              (cacheOnly && !is.null(destDir))
              )

    if (reloadOnlyLatest && is.null(destDir)) {
        stop("When using reloadOnlyLatest = TRUE, you must specify a value for destDir")
    }

    ## Some series are spread across multiple files. We will download all of them
    ## and bind them together.
    allFiles <- sapply(seriesOptions(series)[[option]], function(x) NULL,
                       USE.NAMES = TRUE, simplify = FALSE)


    for (ii in seq_along(allFiles)) {

        subFileName <- names(allFiles)[ii]

        destfile <- path.expand(file.path(destDir, paste0(subFileName, ".xlsx")))

        if (file.exists(destfile) ||
            (reloadOnlyLatest && ii != length(allFiles)) ||
            cacheOnly
            ) {

            if (!quiet) {
                message("File already exists with no updates. Nothing to download")
            }

        } else {

            url <- dataFileURL(series, option)

            Foo <- try(download.file(url = url,
                                     destfile = destfile,
                                     mode = "wb",
                                     quiet = quiet
                                     )
                       )

            if (inherits(Foo, "try-error") || Foo > 0) {
                stop("Could not download ", url)
            }

            Sys.sleep(wait)

        }

        results <- readSpreadsheet(destfile, series, subFileName,
                                   fieldForColumnNames, deleteFiles)

        allFiles[[ii]] <- results


    }

    if (series == "SDDS") {

        out <- allFiles[[1]]
        out <- append(out, allFiles[[2]])
        out <- append(out, allFiles[[3]])

        return(out)

    }

    ## Some spreadsheets are not in the standard format.
    ## We don't try to do anything with them.
    if (series %in% specialCases())
        return(allFiles[[1]])

    ## For datasets that contain more than one spreadsheet (stored here as a list
    ## of data frames) we will combine them together. This applies to the data files
    ## and the metadata files.

    ## I tried doing this with Reduce(merge... but it was actually slower and the
    ## order kept getting messed up. Here the order of colnames(allData) matches
    ## the order of allMeta so I won't change it any further.

    allData <- lapply(allFiles, function(x) x[["data"]])

    if (length(allData) > 1) {

        allColumnNames <- Reduce(union, lapply(allData, colnames))
        for (ii in seq_along(allData)) {
            for (jj in allColumnNames[allColumnNames %!in% colnames(allData[[ii]])]) {
                allData[[ii]][, jj] <- NA_real_
            }
            allData[[ii]] <- allData[[ii]][, allColumnNames]
        }

        allData <- specialRBind(allData)

    } else {
        allData <- allData[[1]]
    }

    allMeta <- lapply(allFiles, function(x) x[["meta"]])

    if (length(allMeta) > 1) {

        keys <- lapply(allMeta, function(x) x[, "Series Id"])

        allKeys <- unique(do.call(c, keys))

        index <- match(allKeys, unlist(keys))

        allMeta <- do.call(rbind, allMeta)[index, ]

    } else {
        allMeta <- allMeta[[1]]
    }

    if (series == "B13")
        allMeta <- allMeta[!duplicated(allMeta[, "Series Id"]), ]

    if (!all(colnames(allData)[-1] == allMeta[, "Series Id"])) {
        stop("SeriesID's do not match between data and meta. Something has gone wrong.")
    }

    allData <- allData[, c("Series Id", allMeta[, "Series Id"])]
    colnames(allData)[[1]] <- "Date"

    if (replaceColumnNames)
        colnames(allData) <- transformColumnNames(allMeta, fieldForColumnNames)

    out <- list(meta = allMeta, data = allData)

    rownames(out[["meta"]]) <- NULL
    rownames(out[["data"]]) <- NULL

    out

}
