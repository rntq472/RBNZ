##' Read a Downloaded Spreadsheet
##' 
##' @inheritParams getSeries
##' @param destfile File path of the downloaded spreadsheet.
##' @param subFileName Name of the spreadsheet for download according to the source
##'                    URL.
##' @param deleteFiles Logical indicating whether to delete the spreadsheet after
##'                    reading it.
##' 
##' @return The contents of the spreadsheet. For most series this will be in the
##'         form of a list of two data frames, one called \dQuote{data} and the
##'         other \dQuote{meta}. For some series (see specialCases()), the data
##'         is not in the standard format as the rest and so is just returned
##'         directly as the results of read_xlsx for each sheet in the spreadsheet.
##' 
##' @author Jasper Watson
##' 
##' @note Series B13 doesn't have a full date specified, only year or month and
##'       year. These values values are returned as the first of the month/year.
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
                            deleteFiles){
    
    ## Some spreadsheets are not in the standard format. We don't try to do
    ## anything with them.
    if (series %in% specialCases() ){
        
        Foo <- try({
            sheets <- excel_sheets(destfile)
        }, silent = TRUE)
        
        if (inherits(Foo, 'try-error') ){
            stop('readxl could not read ', destfile)
        }
        
        FUN <- switch(readxl::format_from_ext(destfile),
                      xls = readxl::read_xls,
                      xlsx = readxl::read_xlsx
                      )
        
        Foo <- try({
            out <- sapply(sheets, function(x)
                suppressWarnings(FUN(destfile, sheet = x,
                                           .name_repair = 'minimal')),
                USE.NAMES = TRUE, simplify = FALSE)
        }, silent = TRUE)
        
        if (inherits(Foo, 'try-error') ){
            stop('readxl could not read ', destfile)
        }
        
        for (ii in seq_along(out))
            out[[ii]] <- as.data.frame(out[[ii]])
        
        return(out)
        
    }
    
    meta <- readxl::read_xlsx(destfile, sheet = 'Series Definitions')
    
    colNames <- c('Date', meta$Series)
    
    if (series == 'B13') {
        
        if (subFileName == 'hb13-1983-to-1998'){
            
            ## This file doesn't have a full date specified, only month and year.
            
            ## There are some ".." in place of missing dates so use suppressWarnings.
            dat <- suppressWarnings({
                readxl::read_xlsx(destfile,
                                  sheet = 'Data',
                                  skip = 4,
                                  .name_repair = 'minimal',
                                  col_type = ifelse(grepl('Date', colNames),
                                                    'date', 'numeric')
                                  )
            })
            
            dat[, 1] <- floor_date(dat[[1]], 'month')
            
            ## SeriesId is missing from this spreadsheet. Add it manually.
            
            meta[, 'Series Id'] <- c('MissingID_1', 'MissingID_2', 'MissingID_3',
                                     'MissingID_4', 'MissingID_5', 'MissingID_6',
                                     'MissingID_7', 'MissingID_8')
            
            colnames(dat)[2:9] <- unlist(meta[, 'Series Id'])
            
        } else if (subFileName == 'hb13-1999-to-2014'){
            
            ## This file doesn't have a full date specified, only a year.
            
            tmp <- ifelse(grepl('Date', colNames), 'date', 'numeric')
            tmp[1] <- 'text'
            
            dat <- readxl::read_xlsx(destfile,
                                     sheet = 'Data',
                                     skip = 4,
                                     .name_repair = 'minimal',
                                     col_type = tmp
                                     )
            
            dat[, 1] <- as.POSIXct(paste0(dat[[1]], '-01-01'))
            
            ## SeriesId is missing from this spreadsheet. Add it manually.
            
            meta[, 'Series Id'] <- c('MissingID_1', 'MissingID_2', 'MissingID_3',
                                     'MissingID_4', 'MissingID_5', 'MissingID_6',
                                     'MissingID_7', 'MissingID_8')
            
            colnames(dat)[2:9] <- unlist(meta[, 'Series Id'])
            
        } else {
            
            ## This file doesn't have a full date specified, only a year.
            
            dat <- readxl::read_xlsx(destfile,
                                     sheet = 'Data',
                                     skip = 4,
                                     .name_repair = 'minimal',
                                     col_type = ifelse(grepl('Date', colNames),
                                                       'date', 'numeric')
                                     )
            
            dat[, 1] <- floor_date(dat[[1]], 'year')
            
        }
        
    } else if (series == 'B10'){
        
        dat <- readxl::read_xlsx(destfile,
                                 sheet = 'Data',
                                 skip = 4,
                                 .name_repair = 'minimal',
                                 col_type = ifelse(grepl('Date', colNames),
                                                   'date', 'numeric')
                                 )
        
    } else {
        
        dat <- readxl::read_xlsx(destfile,
                                 sheet = 'Data',
                                 skip = 4,
                                 .name_repair = 'minimal',
                                 col_type = c('date', rep('numeric', nrow(meta)))
                                 )
        
    }
    
    if (deleteFiles)
        unlink(destfile)
    
    ## readxl imports everything as UTC. Convert to NZ timezone.
    ## See https://github.com/tidyverse/readxl/issues/347
    isDate <- vapply(colnames(dat), function(x) inherits(dat[[x]], 'POSIXct'),
                     logical(1))
    for (ii in which(isDate))
        dat[, ii] <- force_tz(dat[, ii], 'Pacific/Auckland')
    
    dat <- as.data.frame(dat, stringsAsFactors = FALSE)
    meta <- as.data.frame(meta, stringsAsFactors = FALSE)
    
    if (nrow(meta) != (ncol(dat) - 1))
        warning("nrow of meta != (ncol of data - 1); this shouldn't happen.")
    
    list(data = dat, meta = meta)
    
}
