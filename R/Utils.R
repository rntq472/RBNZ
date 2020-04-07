##' List All Data Series Available for Download
##'
##' @return Character vector of series names.
##'
##' @author Jasper Watson
##'
##' @examples
##'
##' print(allAvailableSeries())
##'
##' @export
##' 
##
allAvailableSeries <- function()
    names(seriesOptions())


`%!in%` <- function(x, y)
    !(x %in% y)

cat0 <- function(...)
    cat(..., sep = '')

baseURL <- function()
    'https://www.rbnz.govt.nz/statistics'

specialCases <- function()
    c('D3', 'D10', 'D12', 'F5', 'F3', 'F4', 'E1', 'SDDS')

transformColumnNames <- function(meta, fieldForColumnNames){
    
    colNames <- meta[, fieldForColumnNames, drop = FALSE]
    colNames <- apply(colNames, 1, function(x) paste(x, collapse = '_'))
    
    colNames <- gsub('\\s+', '_', colNames)
    
    colNames <- gsub('\\(|\\)', '', colNames)
    
    colNames <- c('Date', colNames)
    
    colNames <- gsub('\\.', '', colNames)
    colNames <- gsub('_+$', '', colNames)
    colNames <- gsub('_-_', '_', colNames)
    
    if (any(duplicated(colNames)))
        colNames <- make.names(colNames, unique = TRUE)
    
    colNames
    
}

specialRBind <- function(x){
    
    isDate <- lapply(x, function(x)
        sapply(x, function(y) inherits(y, 'POSIXct')))
    
    anyDate <- Reduce(`|`, isDate)
    
    for (ii in seq_along(x) ){
        
        for (jj in seq_along(x[[ii]]) ){
            
            if (anyDate[jj] & !isDate[[ii]][jj] & all(is.na(x[[ii]][, jj])) ){
                
                x[[ii]][, jj]<- as.POSIXct(x[[ii]][, jj], origin = '1970-01-01')
                
            }
        }
    }
    
    do.call(rbind, x)
    
}
