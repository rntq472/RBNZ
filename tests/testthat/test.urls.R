



context("Valid URL's")

test_that("Each series has a valid webpage", {

    skip_on_cran()
    
    allSeries <- names(seriesOptions())
    
    for (series in allSeries){
        
        url <- getSeriesPageURL(series)
        
        expect_identical(status_code(HEAD(url)), 200L)
        
    }
    
})

context("Valid URL's")

test_that("Each series has a valid webpage", {

    skip_on_cran()
    
    allSeries <- seriesOptions()
    
    for (series in names(allSeries) ){

        seriesPage <- readSeriesPage(series)
        Sys.sleep(1)
        
        allOptions <- names(allSeries[[series]])

        for (category in allOptions){

            for (op in allSeries[[series]][[category]]){
                
                url <- getDownloadLink(op, seriesPage, series)

                expect_identical(status_code(HEAD(url)), 200L)

            }
            
        }
        
    }

})
