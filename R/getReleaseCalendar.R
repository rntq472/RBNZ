##' Download the Release Calendar for RBNZ Datasets
##' 
##' Downloads the table of release dates the RBNZ provides at
##' \url{https://www.rbnz.govt.nz/statistics/statistics-release-calendar}.
##' 
##' @param excludeDailyReleases Logical indicating whether to exclude series that
##'                             released daily from the calendar returned.
##' @param verbose Logical to be passed to RSelenium::rsDriver and/or
##'                wdman::phantomjs. Defaults to FALSE
##' @param ... Other arguments to pass to RSelenium::rsDriver. If one of these
##'            arguments is \dQuote{browser} then the function will use that
##'            instead of PhantomJS, see the details and examples below.
##' 
##' @return Data frame containing upcoming release dates.
##' 
##' @author Jasper Watson
##' 
##' @details The release calendar on the RBNZ website requires a few button clicks
##'          to display so we use the RSelenium package to trigger the necessary
##'          javascript.
##'          
##'          The default option uses PhantomJS \url{https://phantomjs.org/}.
##'          This needs to be installed and on your path.
##'          
##'          Alternatively one can also use a headless Firefox or Chrome browser.
##'          The former requires geckodriver to be installed and on your path,
##'          \url{https://github.com/mozilla/geckodriver}, while the latter requires
##'          ChromeDriver, \url{https://sites.google.com/a/chromium.org/chromedriver/}.
##'          These both require a flag to be passed to RSelenium::rsDriver to signal
##'          that a headless browser should be used, see the examples below.
##' 
##' @examples
##' 
##' \dontrun{
##' 
##' ## The default option uses PhantomJS:
##' x <- getReleaseCalendar()
##' 
##' ## Instead of PhantomJS one could also use firefox:
##' x <- getReleaseCalendar(browser = 'firefox',
##'                         extraCapabilities = list("moz:firefoxOptions" =
##'                                               list(args = list('--headless')))
##'                         )
##' 
##' ## Or Chrome:
##' x <- getReleaseCalendar(browser = 'chrome',
##'                         extraCapabilities = list("chromeOptions" =
##'                                               list(args = list('--headless')))
##'                         )
##' ## Sometimes you might have to specify the chromever argument;
##' ## see RSelenium::rsDriver for details.
##' 
##' }
##' 
##' @export
##' 
##
getReleaseCalendar <- function(excludeDailyReleases = TRUE, verbose = FALSE, ...){
    
    if (!requireNamespace('RSelenium', quietly = TRUE))
        stop('The RSelenium package is required to use this function')
    
    url <- 'https://www.rbnz.govt.nz/statistics/statistics-release-calendar'
    
    if ('browser' %in% names(list(...)) ){
        
        rD <- RSelenium::rsDriver(verbose = verbose, ...)
        
        on.exit({
            rD[["server"]]$stop()
        })
        
        remDr <- rD[["client"]]
        
        on.exit({
            remDr$close()
        }, add = TRUE, after = FALSE)
        
    } else {
        
        ## I should be able to use use:
        ## rD <- rsDriver(browser = 'phantomjs')
        ## but that does not work for me. Nor does it seem to work for others either:
        ## https://stackoverflow.com/questions/57369736/how-do-i-open-a-phantom-browser-through-selenium
        
        ## Instead I used the approach of this person which was to start the server
        ## using wdman::phantomjs rather than RSelenium::rsDriver.
        ## https://github.com/bluegreen-labs/snotelr/blob/master/R/snotel_info.r
        
        requireNamespace('wdman', quietly = TRUE)
        
        pjs <- try({
            
            wdman::phantomjs(port = 4567L, verbose = verbose)
            
        }, silent = TRUE)
        
        on.exit({
            pjs$stop()
        })
        
        Foo <- try({
            
            remDr <- RSelenium::remoteDriver(browserName = 'phantomjs', port = 4567L)
            
            remDr$open(silent = TRUE)
            
        }, silent = TRUE)
        
        on.exit({
            remDr$close()
        }, add = TRUE, after = FALSE)
        
    }
    
    remDr$navigate(url)

    ## Switch the Period form to "All periods".
    webElem <- remDr$findElement(using = "id", value = "rbPeriod")
    script <- "arguments[0].value = -1;"
    remDr$executeScript(script, args = list(webElem))
    
    ## If we don't want to exclude daily releases we have to set a value on the
    ## webpage accordingly.
    if (!excludeDailyReleases){
        
        webElem <- remDr$findElement(using = "id", value = "rbExcludeDailyReleases")
        script <- "arguments[0].value = 0;"
        remDr$executeScript(script, args = list(webElem))
        
    }
    
    ## We have to click a button for the webpage to display the table of values.
    webElem <- remDr$findElement(using = "name", value = "submit")
    webElem$clickElement()
    
    page <- remDr$getPageSource()
    
    htmlPage <- read_html(page[[1]])
    
    out <- html_table(htmlPage)[[1]]
    
    out$Date <- strptime(out$Date, format = '%d %b %Y', tz = 'Pacific/Auckland')

    colnames(out)[colnames(out) == 'Report Period'] <- 'ReportPeriod'
    
    out
    
}
