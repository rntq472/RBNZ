


## Date columns that are specified as "YYYY" only are not interpreted correctly by read_excel.
## B13


##' @importFrom lubridate force_tz
##' @importFrom readxl read_xlsx
##' @importFrom readxl excel_sheets
##' 
##
readSpreadsheet <- function(destfile, series, keepTibble){
    
    ## Some spreadsheets are not in the standard format. We don't try to do anything with them.
    if (series %in% specialCases() ){
        
        sheets <- excel_sheets(destfile)
        
        out <- sapply(sheets, function(x) read_xlsx(destfile, sheet = x),
                      USE.NAMES = TRUE, simplify = FALSE)
        
        if (!keepTibble)
            for (ii in seq_along(out))
                out[[ii]] <- as.data.frame(out[[ii]])
        
        return(out)
        
    }
    
    meta <- read_xlsx(destfile, sheet = 'Series Definitions')
    
    colNames <- processColumnNames(series, meta)
    
    ## Column types are assumed to be numeric unless the column name contains "Date" in it.
    ## This is case-sensitive because I have seen examples where "Date" was truly a date and
    ## "date" was part of the description. Ouch.
    dat <- readxl::read_xlsx(destfile,
                             sheet = 'Data',
                             skip = 5,
                             col_names = colNames,
                             col_type = ifelse(grepl('Date', colNames), 'date', 'numeric')
                             )
    
    ## readxl imports everything as UTC. Convert to NZ timezone.
    ## See https://github.com/tidyverse/readxl/issues/347
    isDate <- vapply(colnames(dat), function(x) inherits(dat[, x], 'POSIXct'), logical(1))
    for (ii in which(isDate))
        dat[, ii] <- force_tz(dat[, ii], 'Pacific/Auckland')
    
    if (!keepTibble){
        dat <- as.data.frame(dat, stringsAsFactors = FALSE)
        meta <- as.data.frame(meta, stringsAsFactors = FALSE)
    }
    
    if (nrow(meta) != (ncol(dat) - 1))
        warning("nrow of meta != (ncol of data - 1); this shouldn't happen.")
    
    list(data = dat, meta = meta)
    
}
