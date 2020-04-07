

SDDSurl <- function(subFileName, seriesPage, series, option){
    
    xpath <- paste0("//*[contains(@href, '/-/media/ReserveBank/Files/Statistics/",
                    tolower(series),
                    "')]")
    
    linkNode <- html_nodes(seriesPage, xpath = xpath)
    
    allPaths <- html_attr(linkNode, 'href')
    
    allDates <- gsub('/-/media/ReserveBank/Files/Statistics/(S|s)(D|d)(D|d)(S|s)/\\d+/(S|s)(D|d)(D|d)(S|s)\\s?-?([[:alpha:]]+\\s?-?\\d+).xls.*',
                     '\\9', allPaths)
    
    allDates <- gsub('-| ', '', allDates)
    
    allMonths <- gsub('^([[:alpha:]]+)\\d+', '\\1', allDates)
    allMonths <- substring(allMonths, 1, 3)
    
    allYears <- gsub('^[[:alpha:]]+(\\d+)', '\\1', allDates)
    allYears[nchar(allYears) == 2] <- paste0('20', allYears[nchar(allYears) == 2])
    
    allDates <- as.Date(paste('01', allMonths, allYears), format = '%d %b %Y')
    
    if (subFileName == 'SDDS_current'){
        
        filePath <- allPaths[which.max(allDates)]
        
    } else {
        
        if (!grepl('^SDDS_20\\d\\d-\\d\\d$', subFileName) ){
            
            stop('option must be of the form "current" or a year and month specified as "20nn-nn". Earliest available is 2000-03.')
            
        }
        
        filePath <- allPaths[as.character(allDates) == paste0(gsub('SDDS_',
                                                                   '', subFileName),
                                                              '-01')]
        
        if (length(filePath) == 0){
            stop(option, ' for SDDS is not available.')
        }
        
    }
    
    url <- file.path('https://www.rbnz.govt.nz' , filePath)
    
    if (length(url) > 1)
        url <- url[1]

    url <- gsub('\\s', '\\%20', url)
    
    url
    
}


getSDDS <- function(series, option, destDir, quiet, deleteFiles, fieldForColumnNames){
    
    stopifnot(series %in% allAvailableSeries(),
              length(series) == 1,
              length(option) == 1)
    
    ## Each data series has it's own webpage containing the files to be downloaded.
    seriesPage <- readSeriesPage(series, quiet)
    
    allFiles <- sapply(paste0('SDDS_', option), function(x) NULL,
                       USE.NAMES = TRUE, simplify = FALSE)
    
    subFileName <- names(allFiles)
    
    url <- SDDSurl(subFileName, seriesPage, series, option)
    
    destfile <- path.expand(file.path(destDir,
                                      paste0(subFileName,
                                             ifelse(grepl('\\.xls\\?', url),
                                                              '.xls', '.xlsx'))))
    
    Foo <- try(download.file(url = url,
                             destfile = destfile,
                             mode = 'wb',
                             quiet = quiet
                             )
               )
    
    if (inherits(Foo, 'try-error') || Foo > 0){
        stop('Could not download ', url)
    }
    
    results <- readSpreadsheet(destfile, series, subFileName, fieldForColumnNames,
                               deleteFiles)
    
    results
    
}
