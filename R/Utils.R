


`%!in%` <- function(x, y)
    !(x %in% y)

baseURL <- function()
    'https://www.rbnz.govt.nz/statistics'


## includeDiscontinued = TRUE

#allSeries <- function(){
    
#    current <- c('B1', 'B4', 'B2', 'B3', 'B6', 'B20', 'B21', 'B10', 'B13', 'C5', 'C12', 'C13', 'C30', 'C31', 'C32', 'C35', 'C40', 'C41', 'C50', 'C60', 'D3', 'D10', 'D12', 'F5', 'R1', 'R2', 'R3', 'F3', 'F4', 'S10', 'S30', 'S31', 'S32', 'S33', 'S34', 'S40', 'S41', 'S20', 'S21', 'L1', 'L2', 'L3', 'J10', 'J20', 'T1', 'T4', 'T11', 'T21', 'T31', 'T40', 'T41', 'T42', 'T43', 'T44', 'T45', 'T46', 'T47', 'T48', 'C21', 'C22', 'D9', 'D30', 'D31', 'D35', 'M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8', 'M9', 'M10', 'M11', 'M12', 'M13', 'M14', 'E1', 'E2', 'SDDS')
    
#    current
    
#}


specialCases <- function()
    c('D3', 'D10', 'D12', 'F5', 'F3', 'F4', 'D1', 'E1')


processColumnNames <- function(series, meta){
    
    colNames <- meta$Series#gsub('\\(.*\\)', '', meta$Series)
    
    colNames <- gsub('\\s+', '_', colNames)
    
    colNames <- gsub('\\(|\\)', '', colNames)
    
    if (series == 'B1'){
        
        colNames[meta$Group == 'TWI'] <- 'TWI'
        
    }

    if (any(duplicated(colNames)))
        colNames <- paste(gsub('\\s+', '_', meta$Group), colNames, sep = '_')
    
   
    colNames <- c('Date', colNames)
    
    colNames <- gsub('\\.', '', colNames)
    colNames <- gsub('_+$', '', colNames)
    colNames <- gsub('_-_', '_', colNames)
    
    colNames
    
}
