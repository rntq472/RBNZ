




## https://www.rbnz.govt.nz/statistics


## identical(status_code(HEAD(url)), 200L)

## Check all of the urls exist in the unit tests.

getSeries <- function(series,
                      option = getDefaultOption(series),
                      destDir,
                      quiet = TRUE,
                      keepTibble = FALSE
                      ){
    
    stopifnot(series %in% names(seriesOptions()), option %in% names(seriesOptions(series)))
    
    if (missing(destDir) ){
        destDir <- tempdir()
        if (!dir.exists(destDir))
            dir.create(destDir)
        on.exit(unlink(destDir, recursive = TRUE))
    }

    ## Each data series has it's own webpage containing the files to be downloaded.
    seriesPage <- readSeriesPage(series)

    allFiles <- sapply(seriesOptions(series)[[option]], function(x) NULL,
                       USE.NAMES = TRUE, simplify = FALSE)
    
    for (ii in seq_along(allFiles) ){

        op <- names(allFiles)[ii]

        destfile = file.path(destDir, paste0(op, '.xlsx'))
        
        url <- getDownloadLink(op, seriesPage, series)
        
        Foo <- try(download.file(url = url,
                                 destfile = destfile,
                                 ##method = 'wget',
                                 mode = 'wb',
                                 quiet = quiet
                                 )
                   )
        
        if (inherits(Foo, 'try-error') || Foo > 0){
            cat('Error.\n')
            return(invisible(NULL))
        }
        
        results <- readSpreadsheet(destfile, series, keepTibble)

        allFiles[[ii]] <- results
        
    }
    
    ## Some spreadsheets are not in the standard format. We don't try to do anything with them.
    if (series %in% specialCases())
        return(allFiles[[1]])
    
    allData <- lapply(allFiles, function(x) x$data)
    
    if (length(allData) > 1){
        ## Clean this up into a fast merge.
        allColumnNames <- Reduce(union, lapply(allData, colnames))
        for (ii in seq_along(allData) ){
            for (jj in allColumnNames[allColumnNames %!in% colnames(allData[[ii]])]){
                allData[[ii]][, jj] <- NA_real_
            }
            allData[[ii]] <- allData[[ii]][, allColumnNames]
        }
        
        allData <- do.call(rbind, allData)
        
    } else {
        allData <- allData[[1]]
    }
    
    allMeta <- lapply(allFiles, function(x) x$meta)
    
    if (length(allMeta) > 1){
        
        keys <- lapply(allMeta, function(x) apply(x, 1, paste, collapse = '-'))
        
        allKeys <- unique(do.call(c, keys))
        
        index <- match(allKeys, unlist(keys))
        
        allMeta <- do.call(rbind, allMeta)[index, ]
        
    } else {
        allMeta <- allMeta[[1]]
    }
    
    out <- list(meta = allMeta, data = allData[, processColumnNames(series, allMeta)])
    
    rownames(out$meta) <- NULL
    rownames(out$data) <- NULL
    
    out
    
}


