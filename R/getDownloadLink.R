##' Determine the URL for a File to be Downloaded
##' 
##' @inheritParams getSeries
##' @param subFileName The name of the file to be downloaded, as provided by
##'                    seriesOptions(). May contain only part of a series.
##' @param seriesPage An XML document returned by xml2::read_html containing the
##'                   webpage pertaining to the desired series.
##' 
##' @return Character string giving the URL of the file to be downloaded.
##' 
##' @author Jasper Watson
##' 
##' @keywords internal
##' 
##
getDownloadLink <- function(subFileName, seriesPage, series){
    
    xpath <- paste0("//*[contains(@href, '/-/media/ReserveBank/Files/Statistics/tables/",
                    tolower(series),
                    "/",
                    subFileName,
                    ".xlsx')]")
    
    linkNode <- html_nodes(seriesPage, xpath = xpath)
    
    if (length(linkNode) < 1){
        
        xpath <- paste0("//*[contains(@href, '/-/media/ReserveBank/Files/Statistics/tables/",
                        series,
                        "/",
                        subFileName,
                        ".xlsx')]")
        
        linkNode <- html_nodes(seriesPage, xpath = xpath)
        
    }
    
    if (length(linkNode) < 1){
        
        xpath <- paste0("//*[contains(@href, '/-/media/ReserveBank/Files/Statistics/tables/",
                        tolower(series),
                        "/",
                        subFileName,
                        ".XLSX')]")
        
        linkNode <- html_nodes(seriesPage, xpath = xpath)
        
    }
    
    filePath <- html_attr(linkNode, 'href')
    
    url <- file.path('https://www.rbnz.govt.nz' , filePath)
    
    if (length(url) > 1)
        url <- url[1]
    
    url
    
}
