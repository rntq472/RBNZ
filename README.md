
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RBNZ

The RBNZ package allows users to download data from the Reserve Bank of
New Zealand website.

An overview of the package can be found on
[CRAN](https://cran.r-project.org/web/packages/RBNZ/vignettes/Overview.html)
or in
[vignettes/Overview.Rmd](https://github.com/rntq472/RBNZ/blob/master/vignettes/Overview.Rmd).

## Installation

``` r
## Install from CRAN:
install.packages('RBNZ')

## Install the development version from GitHub:
## install.packages("devtools")
devtools::install_github("rntq472/RBNZ")
```

# Note - this package is currently unable to function after the RBNZ put their website behind Cloudflare.

In March 2021 the Reserve Bank made changes to their website which
blocked robots and scrapers, including this package. I have reached out
to them to address this but so far have not had any luck getting a
response; I will continue to try and resolve the issue.

In the meantime I have made edits to the package so that users can
download the data spreadsheets manually and then use the data processing
functionality of this package. It works as follows:

Users must download the webpage of the series they are interested in and
save the html file as series.html. They then must download the
spreadsheets needed from that page and save them in the same directory
without changing their file names.

For example for the B1 series a user could download the webpage
<https://www.rbnz.govt.nz/statistics/b1> through their browser and save
it as B1.html. In the same directory they would download and save the
following spreadsheets.

  - hb1-daily-1973-1998.xlsx
  - hb1-daily-1999-2017.xlsx
  - hb1-daily.xlsx

They could then load the data as follows:

``` r

library(RBNZ)

dat <- getSeries('B1', destDir = 'path_to_downloaded_files')
```

The monthly option can be used after downloading hb1-monthly.xlsx and
hb1-monthly-1973-1998.xlsx.
