

getSeriesPageURL <- function(series){

    ## Some of the series webpages are just the series name and some have extra details.
    ## We will just hard code this because the webpage giving the index of datasets doesn't
    ## have much structure to it, just div after div, which makes it hard to extract
    ## the necessary links. It is also difficult to determine the names of each series
    ## without knowing them in advance.
    tmp <- switch(series,
                  B6 = 'b6-yields-on-loans',
                  B20 = 'b20-new-customer-average-rate',
                  B21 = 'b21-new-residential-mortgage-special-interest-rates',
                  C40 = 'c40-residential-mortgage-lending-by-debt-to-income-dti-purpose-use',
                  C41 = 'c41-residential-mortgage-borrower-gross-income-bgi',
                  C50 = 'c50-money-and-credit-aggregates',
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



readSeriesPage <- function(series){
    
    url <- getSeriesPageURL(series)
    
    read_html(url)
    
}
