

getDownloadLink <- function(op, seriesPage, series){
    
    xpath <- paste0("//*[contains(@href, '/-/media/ReserveBank/Files/Statistics/tables/",
                    tolower(series),
                    "/",
                    op,
                    ".xlsx')]")
    
    linkNode <- html_nodes(seriesPage, xpath = xpath)
    
    if (length(linkNode) < 1){
        
        xpath <- paste0("//*[contains(@href, '/-/media/ReserveBank/Files/Statistics/tables/",
                        series,
                        "/",
                        op,
                        ".xlsx')]")
        
        linkNode <- html_nodes(seriesPage, xpath = xpath)
        
    }
    
    filePath <- html_attr(linkNode, 'href')
    
    url <- file.path('https://www.rbnz.govt.nz' , filePath)
    
    if (length(url) > 1)
        url <- url[1]
    
    url
    
}
