##' List All Data Series Available for Download
##'
##' @return Character vector of series names.
##'
##' @author Jasper Watson
##'
##' @examples
##'
##' print(allAvailableSeries())
##'
##' @export
##'
##
allAvailableSeries <- function()
    names(seriesOptions())

`%!in%` <- function(x, y)
    !(x %in% y)

cat0 <- function(...)
    cat(..., sep = "")

## Deprecated  - the series pages are no longer used.
baseURL <- function()
    "https://www.rbnz.govt.nz/statistics"

specialCases <- function()
    c("D3", "D10", "D12", "E1", "F3", "F4", "F5", "M15", "SDDS")

dataFileURL <- function(series, option) {

    group <- if (series %in% c("M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8",
                               "M9", "M10", "M12", "M14")) {
                 "m"
             } else if (series %in% c("B1", "B2", "B3", "B4", "B6", "B7", "B10",
                                      "B13", "B20", "B21", "B25", "B26", "B27")) {
                 "b"
             } else if (series %in% c("J10", "J20")) {
                 "j"
             } else if (series %in% c("E1", "E2", "SDDS")) {
                 "e"
             } else if (series %in% c("C5", "C12", "C13", "C21", "C22", "C30",
                                      "C31", "C32", "C35", "C40", "C41", "C50",
                                      "C51", "C52", "C55", "C60", "C65", "C66")) {
                 "c"
             } else if (series %in% c("H1", "H2", "H3")) {
                 "h"
             } else if (series %in% c("D3", "D9", "D10", "D12", "D30", "D31",
                                      "D35")) {
                 "d"
             } else if (series %in% c("T1", "T4", "T11", "T21", "T31", "T40",
                                      "T41", "T42", "T43", "T44", "T45", "T46",
                                      "T47", "T48")) {
                 "t"
             } else if (series %in% c("L1", "L2", "L3", "S10", "S20", "S21",
                                      "S30", "S31", "S32", "S33", "S34", "S35",
                                      "S36", "S37", "S40", "S41", "S50")) {
                 "l-s"
             } else if (series %in% c("D3", "D9", "D10", "D12", "D30", "D31",
                                      "D35", "F3", "F4", "F5", "R1", "R2", "R3")) {
                 "d-f-r"
             } else {
                 stop("Unrecognised series name")
             }

    paste0("https://www.rbnz.govt.nz/-/media/project/sites/rbnz/files/statistics/series/",
           group,
           "/",
           tolower(series),
           "/",
           option,
           ".xlsx")

}


transformColumnNames <- function(meta, fieldForColumnNames) {

    colNames <- meta[, fieldForColumnNames, drop = FALSE]
    colNames <- apply(colNames, 1, paste, collapse = "_")

    colNames <- gsub("\\s+", "_", colNames)

    colNames <- gsub("\\(|\\)", "", colNames)

    colNames <- c("Date", colNames)

    colNames <- gsub("\\.", "", colNames, fixed = TRUE)
    colNames <- gsub("_+$", "", colNames)
    colNames <- gsub("_-_", "_", colNames, fixed = TRUE)

    if (anyDuplicated(colNames))
        colNames <- make.names(colNames, unique = TRUE)

    colNames

}

cleanColumnNames <- function(x) {

    x <- gsub("\\s+", "_", x)
    x <- gsub("\\(|\\)", "", x)
    x <- gsub("\\.", "", x, fixed = TRUE)
    x <- gsub("_+$", "", x)
    x <- gsub("_-_", "_", x, fixed = TRUE)

    x <- make.names(x, unique = TRUE)

    x <- gsub("^X", "", x)

    x

}

specialRBind <- function(x) {

    isDate <- lapply(x, function(x)
        sapply(x, inherits, what = "POSIXct"))

    anyDate <- Reduce(`|`, isDate)

    for (ii in seq_along(x)) {

        for (jj in seq_along(x[[ii]])) {

            if (anyDate[jj] && !isDate[[ii]][jj] && all(is.na(x[[ii]][, jj]))) {

                x[[ii]][, jj] <- as.POSIXct(x[[ii]][, jj], origin = "1970-01-01")

            }
        }
    }

    do.call(rbind, x)

}
