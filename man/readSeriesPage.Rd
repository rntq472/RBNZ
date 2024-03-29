% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readSeriesPage.R
\name{readSeriesPage}
\alias{readSeriesPage}
\title{Read a Series Webpage Into an XML object}
\usage{
readSeriesPage(series, quiet = TRUE, destDir, deleteFiles, wait = 60)
}
\arguments{
\item{series}{Character string giving the name of the data series to retrieve.}

\item{quiet}{Logical to be passed to utils::download.file.}

\item{destDir}{File path to a directory in which to place the downloaded
spreadsheets. If not specified the value of getOption("RBNZ.destDir") will
be checked. If that is NULL too then the files will be placed into tempdir()
and deleted on exit.}

\item{wait}{Numeric giving the number of seconds to wait between downloads.
Defaults to 60. Note that this applies to reading the series page
and to each individual spreadsheet download, so a series with one
spreadsheet would have two downloads sixty seconds apart.}
}
\value{
An XML document returned by xml2::read_html containing the webpage
pertaining to the desired series.
}
\description{
Deprecated - the series pages are no longer used.
}
\author{
Jasper Watson
}
\keyword{internal}
