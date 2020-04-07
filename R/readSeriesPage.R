##' Determine the URL of a Webpage Pertaining to a Series
##' 
##' @inheritParams getSeries
##' 
##' @return Character string giving the URL of the series webpage.
##' 
##' @author Jasper Watson
##' 
##' @keywords internal
##' 
##
getSeriesPageURL <- function(series){
    
    ## Some of the series urls are just the series name and some have extra
    ## details. We will just hard code this because the webpage giving the index
    ## of datasets doesn't have much structure to it which makes it hard to
    ## extract the necessary links. It is also difficult to determine the names
    ## of each series without knowing them in advance.
    
    ## Actually this doesn't seem to be necessary as the website seems to accept
    ## both the the full names listed below and just the series names. I will
    ## continue implementing this however as these are the urls provided by the
    ## index page.
    
    tmp <- switch(series,
                  B6 = 'b6-yields-on-loans',
                  B20 = 'b20-new-customer-average-rate',
                  B21 = 'b21-new-residential-mortgage-special-interest-rates',
                  B25 = 'b25-new-interest-bearing-call-savings-account-interest-rates',
                  B26 = 'b26-new-interest-bearing-term-deposit-interest-rates',
                  B27 = 'b27-new-interest-bearing-term-pie-deposits-interest-rates',
                  C40 = 'c40-residential-mortgage-lending-by-debt-to-income-dti-purpose-use',
                  C41 = 'c41-residential-mortgage-borrower-gross-income-bgi',
                  C50 = 'c50-money-and-credit-aggregates',
                  C51 = 'c51-other-depository-corporations-analytical-accounts',
                  C52 = 'c52-depository-corporations-analytical-accounts',
                  C55 = 'c55-other-financial-corporations-analytical-accounts',
                  C60 = 'c60-credit-conditions-survey',
                  S10 = 's10-banks-balance-sheet',
                  S30 = 's30-banks-assets-loans-by-sector',
                  S31 = 's31-banks-assets-loans-by-purpose',
                  S32 = 's32-banks-assets-loans-by-product',
                  S33 = 's33-banks-assets-loans-fully-secured-by-residential-mortgage-by-repricing',
                  S34 = 's34-banks-assets-loans-by-industry',
                  S40 = 's40-banks-liabilities-deposits-by-sector',
                  S41 = 's41-banks-liabilities-deposits-by-industry',
                  J10 = 'j10-insurance-income-statement',
                  J20 = 'j20-insurance-balance-sheet',
                  tolower(series)
                  )
    
    url <- file.path(baseURL(), tmp)
    
    url
    
}

##' Read a Series Webpage Into an XML object
##' 
##' @inheritParams getSeries
##' 
##' @return An XML document returned by xml2::read_html containing the webpage
##'         pertaining to the desired series.
##' 
##' @author Jasper Watson
##' 
##' @keywords internal
##' 
##
readSeriesPage <- function(series, quiet = TRUE){
    
    url <- getSeriesPageURL(series)
    
    tmp <- tempfile(pattern = "RBNZ", fileext = ".html")
    on.exit(unlink(tmp))
    
    Foo <- try(download.file(url = url,
                             destfile = tmp,
                             mode = 'wb',
                             quiet = quiet
                             )
               )
    
    if (inherits(Foo, 'try-error') || Foo > 0){
        stop('Could not download ', url)
    }
    
    out <- read_html(tmp)
    
    out
    
}
