
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RBNZ

The RBNZ package allows users to download data from the Reserve Bank of
New Zealand website.

An overview of the package can be found on
[CRAN](https://CRAN.R-project.org/package=RBNZ/vignettes/Overview.html)
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

## Usage

The main entry point is the `getSeries` function where users can choose
a data series to retrieve:

``` r

library(RBNZ)

m1 <- getSeries('M1')
```

### Note - the RBNZ website has been put behind Cloudflare so now there are some extra steps for using this package.

One option is to email the RBNZ and request that your (static) public IP
address be whitelisted. The email to contact is listed
[here](https://www.rbnz.govt.nz/about-our-site/terms-of-use).

The second option is to download the necessary files from the RBNZ
website manually through your browser and then use this package to read
and organise them. This can be done by downloading the spreadsheets
needed and saving them in a given directory without changing their file
names. This could be done from the individual series page or from the
[summary
page](https://www.rbnz.govt.nz/statistics/series/data-file-index-page).

For example for the B1 series a user could download and save the
following spreadsheets:

- hb1-daily-1973-1998.xlsx
- hb1-daily-1999-2017.xlsx
- hb1-daily.xlsx

They could then load the data as follows:

``` r

library(RBNZ)

dat <- getSeries('B1', destDir = 'path_to_downloaded_files', cacheOnly = TRUE)
```

If you are always having to do this then you can specify the download
path in your .Rprofile using
`options(RBNZ.destDir = "path/to/stored/files")`.
