##' Read a Downloaded Spreadsheet
##'
##' @inheritParams getSeries
##' @param destfile File path of the downloaded spreadsheet.
##' @param subFileName Name of the spreadsheet for download according to the source
##' URL.
##' @param deleteFiles Logical indicating whether to delete the spreadsheet after
##' reading it.
##'
##' @return The contents of the spreadsheet. For most series this will be in the
##' form of a list of two data frames, one called \dQuote{data} and the
##' other \dQuote{meta}. For some series (see specialCases()), the data
##' is not in the standard format as the rest and so is just returned
##' directly as the results of read_xlsx for each sheet in the spreadsheet.
##'
##' @author Jasper Watson
##'
##' @note Series B13 doesn't have a full date specified, only year or month and
##' year. These values values are returned as the first of the month/year.
##'
##' @importFrom lubridate force_tz
##' @importFrom lubridate floor_date
##' @importFrom readxl read_xlsx
##' @importFrom readxl read_xls
##' @importFrom readxl excel_sheets
##' @importFrom readxl format_from_ext
##'
##' @keywords internal
##'
##
readSpreadsheet <- function(destfile, series, subFileName, fieldForColumnNames,
                            deleteFiles) {

    if (series %in% c("D3", "D10", "D12", "E1", "F3", "F4", "F5", "M15")) {

        FUN <- switch(series,
                      D3 = parse_D3,
                      D10 = parse_D10,
                      D12 = parse_D12,
                      E1 = parse_E1,
                      F3 = parse_F3,
                      F4 = parse_F4,
                      F5 = parse_F5,
                      M15 = parse_M15,
                      )

        out <- FUN(destfile)

        return(out)

    } else if (series %in% "SDDS") {

        out <- parse_SDDS(destfile, subFileName)

        return(out)

    }

    meta <- readxl::read_xlsx(destfile, sheet = "Series Definitions")

    colNames <- c("Date", meta[["Series"]])

    ## Some series require special attention (but unlike the special cases above,
    ## they still end up in a standard format).

    if (series == "B13") {

        tmp <- parse_B13(subFileName, destfile, colNames, meta)
        dat <- tmp[["dat"]]
        meta <- tmp[["meta"]]

    } else if (series == "B10") {

        dat <- parse_B10(destfile, colNames)

    } else if (series == "C60") {

        dat <- parse_C60(destfile, colNames)

    } else if (series == "C66") {

        dat <- parse_C66(destfile, colNames)

    } else {

        dat <- readxl::read_xlsx(destfile,
                                 sheet = "Data",
                                 skip = 4,
                                 .name_repair = "minimal",
                                 col_type = c("date", rep("numeric", nrow(meta)))
                                 )

    }

    if (deleteFiles)
        unlink(destfile)

    ## readxl imports everything as UTC. Convert to NZ timezone.
    ## See https://github.com/tidyverse/readxl/issues/347
    isDate <- vapply(colnames(dat), function(x) inherits(dat[[x]], "POSIXct"),
                     logical(1))
    for (ii in which(isDate)) {
        dat[, ii] <- force_tz(dat[[ii]], "Pacific/Auckland")
        dat[, ii] <- as.Date(dat[[ii]])
    }

    dat <- as.data.frame(dat, stringsAsFactors = FALSE)
    meta <- as.data.frame(meta, stringsAsFactors = FALSE)

    if (nrow(meta) != (ncol(dat) - 1))
        warning("nrow of meta != (ncol of data - 1); this shouldn't happen.")

    list(data = dat, meta = meta)

}
