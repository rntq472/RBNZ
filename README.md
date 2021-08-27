
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

## Note - the RBNZ website has been put behind Cloudflare so now there are some extra steps for using this package.

One option is to email the RBNZ and request that your public IP address
be whitelisted. The email to contact is listed
[here](https://www.rbnz.govt.nz/robots-botnets-and-scrapers-terms-of-service).

The second option is to download the necessary files from the RBNZ
website manually through your browser and then use this package to read
and organise those files. This can be done as follows:

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
