
parse_B13 <- function(subFileName, destfile, colNames, meta) {

    if (subFileName == "hb13-1983-to-1998") {

        ## This file doesn't have a full date specified, only month and year.

        ## There are some ".." in place of missing dates so use suppressWarnings.
        dat <- suppressWarnings({
            readxl::read_xlsx(destfile,
                              sheet = "Data",
                              skip = 4,
                              .name_repair = "minimal",
                              col_type = ifelse(grepl("Date", colNames, fixed = TRUE),
                                                "date", "numeric")
                              )
        })

        dat[, 1] <- floor_date(dat[[1]], "month")

        ## SeriesId is missing from this spreadsheet. Add it manually.

        meta[, "Series Id"] <- c("MissingID_1", "MissingID_2", "MissingID_3",
                                 "MissingID_4", "MissingID_5", "MissingID_6",
                                 "MissingID_7", "MissingID_8")

        colnames(dat)[2:9] <- unlist(meta[, "Series Id"])

    } else if (subFileName == "hb13-1999-to-2014") {

        ## This file doesn't have a full date specified, only a year.

        tmp <- ifelse(grepl("Date", colNames, fixed = TRUE), "date", "numeric")
        tmp[[1]] <- "text"

        dat <- readxl::read_xlsx(destfile,
                                 sheet = "Data",
                                 skip = 4,
                                 .name_repair = "minimal",
                                 col_type = tmp
                                 )

        dat[, 1] <- as.POSIXct(paste0(dat[[1]], "-01-01"))

        ## SeriesId is missing from this spreadsheet. Add it manually.

        meta[, "Series Id"] <- c("MissingID_1", "MissingID_2", "MissingID_3",
                                 "MissingID_4", "MissingID_5", "MissingID_6",
                                 "MissingID_7", "MissingID_8")

        colnames(dat)[2:9] <- unlist(meta[, "Series Id"])

    } else {

        ## This file doesn't have a full date specified, only a year.

        dat <- readxl::read_xlsx(destfile,
                                 sheet = "Data",
                                 skip = 4,
                                 .name_repair = "minimal",
                                 col_type = ifelse(grepl("Date", colNames, fixed = TRUE),
                                                   "date", "numeric")
                                 )

        dat[, 1] <- floor_date(dat[[1]], "year")

    }

    list(dat = dat, meta = meta)


}

parse_B10 <- function(destfile, colNames) {

    dat <- readxl::read_xlsx(destfile,
                             sheet = "Data",
                             skip = 4,
                             .name_repair = "minimal",
                             col_type = ifelse(grepl("Date", colNames, fixed = TRUE),
                                               "date", "numeric")
                             )
    dat

}

parse_C60 <- function(destfile, colNames) {

    ## This file doesn't have a full date specified, only month and year.
    dat <- suppressWarnings({
        readxl::read_xlsx(destfile,
                          sheet = "Data",
                          skip = 4,
                          .name_repair = "minimal",
                          col_type = ifelse(grepl("Date", colNames, fixed = TRUE),
                                            "date", "numeric")
                          )
    })

    tmp <- suppressWarnings({
        readxl::read_xlsx(destfile,
                          sheet = "Data",
                          skip = 4,
                          .name_repair = "minimal",
                          col_type = "text")
    })
    use <- grepl("^\\d+$", tmp[[1]])
    dat[[1]] <- as.POSIXct(NA)
    dat[use, 1] <- as.POSIXct(as.Date(as.numeric(unlist(tmp[use, 1])), origin = "1899-12-30"))
    dat[!use, 1] <- as.POSIXct(as.Date(paste("01", unlist(tmp[!use, 1])), format = "%d %b %Y"))

    dat[[1]] <- as.POSIXct(dat[[1]])

    dat

}

parse_C66 <- function(destfile, colNames) {


    ## C66 has "-" in a numeric column. This is fine but we will treat it
    ## separately so that we can suppress the warnings.

    suppressWarnings({
        dat <- readxl::read_xlsx(destfile,
                                 sheet = "Data",
                                 skip = 4,
                                 .name_repair = "minimal",
                                 col_type = ifelse(grepl("Date", colNames, fixed = TRUE),
                                                   "date", "numeric")
                                 )
    })

    dat
}


parseFile <- function(destfile, nameCols, skipValues, isD3 = FALSE) {

    Foo <- try({
        sheets <- excel_sheets(destfile)
    }, silent = TRUE)

    if (inherits(Foo, "try-error")) {
        stop("readxl could not read ", destfile)
    }

    if (isD3) {
        sheets <- sheets[sheets != "Module1"]
    }

    FUN <- switch(readxl::format_from_ext(destfile),
                  xls = readxl::read_xls,
                  xlsx = readxl::read_xlsx
                  )

    Foo <- try({
        tmp <- sapply(seq_along(sheets), function(x)
            suppressWarnings(FUN(destfile, sheet = sheets[[x]],
                                 .name_repair = "minimal")),
            USE.NAMES = TRUE, simplify = FALSE)
    }, silent = TRUE)

    if (inherits(Foo, "try-error")) {
        stop("readxl could not read ", destfile)
    }

    colNames <- lapply(seq_along(tmp), function(ii) {
        x <- tmp[[ii]][nameCols[[ii]], ]
        apply(x, 2, function(y) paste(y[!is.na(y)], collapse = " "))
    })

    Foo <- try({
        tmp <- sapply(seq_along(sheets), function(x)
            suppressWarnings(FUN(destfile, sheet = sheets[[x]],
                                 skip = skipValues[[x]],
                                 col_names = colNames[[x]],
                                 .name_repair = "minimal")),
            USE.NAMES = TRUE, simplify = FALSE)
    }, silent = TRUE)

    for (ii in seq_along(tmp))
        tmp[[ii]] <- as.data.frame(tmp[[ii]])

    names(tmp) <- sheets

    tmp

}

fixDates <- function(x) {

    out <- rep(as.POSIXct(NA), length(x))
    use1 <- grepl("^\\d+$", x)
    out[use1] <- as.POSIXct(as.Date(as.numeric(x[use1]), origin = "1899-12-30"))
    use2 <- grepl("^\\d+ [[:alpha:]]+ \\d+$", x)
    out[use2] <- as.POSIXct(as.Date(x[use2], format = "%d %b %Y"))
    use3 <- grepl("^\\d+-[[:alpha:]]+-\\d+$", x)
    out[use3] <- as.POSIXct(as.Date(x[use3], format = "%d-%b-%Y"))

    out
}


parse_D3 <- function(destfile) {


    nameCols <- list(2:3, 2:3, 2:3, 2, 2:3, 2:3, 2:3, 2:3, 2:3, 2:3, 2:5)
    skipValues <- c(4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 6)

    tmp <- parseFile(destfile, nameCols, skipValues, TRUE)

    tmp[[2]][[5]] <- fixDates(tmp[[2]][[5]])
    tmp[[3]][[3]] <- fixDates(tmp[[3]][[3]])
    tmp[[11]][[3]] <- fixDates(tmp[[11]][[3]])


    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp

}


parse_D10 <- function(destfile) {

    nameCols <- list(5, 4, 4)
    skipValues <-  c(6, 5, 5)

    tmp <- parseFile(destfile, nameCols, skipValues)


    for (ii in 1:2) {

        use <- grepl("^\\d+$", tmp[[ii]][, 1])

        tmp[[ii]][, 1] <- as.POSIXct(c(as.Date(paste("01", tmp[[ii]][!use, 1]), format = "%d %b %Y"),
                                       as.Date(as.numeric(tmp[[ii]][use, 1]), origin = "1899-12-30"))
                                     )

    }

    colnames(tmp[[1]])[[1]] <- "Date"
    colnames(tmp[[2]])[c(1:4, 10:11, 20:21, 29)] <- c("Date", "1. Cash at beginning of month",
                                                      "2. Government cash influence", "Reserve Bank Transactions", "5. Foreign exchange",
                                                      "6. Cash after public sector transactions during month (=1+2+3+4+5)",
                                                      "8. Cash as at end of month (6+7)", "9. Average settlement cash", "Total")
    colnames(tmp[[3]])[c(1:4, 10:11, 23:24, 35)] <- c("Date",
                                                      "1. Cash at beginning of month", "2. Government cash influence",
                                                      "Reserve Bank Transactions", "5. Foreign exchange",
                                                      "6. Cash after public sector transactions during month (=1+2+3+4+5)",
                                                      "8. Cash as at end of month (6+7)",
                                                      "9. Average settlement cash", "Total")

    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp1 <- setdiff(colnames(tmp[[2]]), colnames(tmp[[3]]))
    for (ii in tmp1)
        tmp[[3]][, ii] <- NA

    tmp2 <- setdiff(colnames(tmp[[3]]), colnames(tmp[[2]]))
    for (ii in tmp2)
        tmp[[2]][, ii] <- NA

    out <- list()
    out[["C16"]] <- tmp[[1]]

    out[["data"]] <- rbind(tmp[[2]], tmp[[3]])

    out

}

parse_D12 <- function(destfile) {

    nameCols <- list(2:4, 2:3, 2:3, 2:3, 2:3, 2:3)
    skipValues <- c(5, 4, 4, 4, 4, 4)

    tmp <- parseFile(destfile, nameCols, skipValues)

    tmp[[4]][[1]] <- fixDates(tmp[[4]][[1]])
    tmp[[4]][[6]] <- fixDates(tmp[[4]][[6]])
    tmp[[4]][[7]] <- fixDates(tmp[[4]][[7]])
    tmp[[6]][[2]] <- fixDates(tmp[[6]][[2]])

    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp

}


parse_E1 <- function(destfile) {

    nameCols <- list(1:6, 1:8, 1:8, 1:8)
    skipValues <- c(6, 8, 8, 8)


    tmp <- parseFile(destfile, nameCols, skipValues)

    for (ii in seq_along(tmp)) {
        tmp[[ii]] <- tmp[[ii]][grepl("^\\d+$", tmp[[ii]][[1]]), ]
        tmp[[ii]][[1]] <- fixDates(tmp[[ii]][[1]])
    }

    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp

}

parse_F3 <- function(destfile) {

    nameCols <- list(1:5, 1:5)
    skipValues <- c(5, 5)


    tmp <- parseFile(destfile, nameCols, skipValues)

    for (ii in seq_along(tmp)) {
        tmp[[ii]] <- tmp[[ii]][grepl("^\\d+$", tmp[[ii]][[1]]), ]
        tmp[[ii]][[1]] <- as.POSIXct(as.Date(paste0("01-01-", tmp[[ii]][[1]]),  format = "%d-%m-%Y"))
    }

    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp

}

parse_F4 <- function(destfile) {

    nameCols <- list(6:7, 4:5, 3)
    skipValues <- c(8, 6, 5)

    tmp <- parseFile(destfile, nameCols, skipValues)

    for (ii in seq_along(tmp)) {
        tmp[[ii]] <- tmp[[ii]][grepl("^\\d+$", tmp[[ii]][[1]]), ]
        tmp[[ii]][[1]] <- as.POSIXct(as.Date(paste0("01-01-", tmp[[ii]][[1]]),  format = "%d-%m-%Y"))
    }

    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp

}

parse_F5 <- function(destfile) {

    nameCols <- list(2)
    skipValues <- c(3)

    tmp <- parseFile(destfile, nameCols, skipValues)

    for (ii in seq_along(tmp)) {
        tmp[[ii]] <- tmp[[ii]][grepl("^\\d+$", tmp[[ii]][[1]]), ]
        tmp[[ii]][[1]] <- fixDates(tmp[[ii]][[1]])
    }

    for (ii in seq_along(tmp)) {

        colnames(tmp[[ii]]) <- cleanColumnNames(colnames(tmp[[ii]]))

    }

    tmp

}

parse_M15 <- function(destfile) {

    parseFile(destfile, 1:13)[[1]]

}

parse_SDDS <- function(destfile, subFileName) {

    if (subFileName == "sdds-monthly") {


        Foo <- try({
            sheets <- excel_sheets(destfile)
        }, silent = TRUE)

        if (inherits(Foo, "try-error")) {
            stop("readxl could not read ", destfile)
        }

        nameCols <- lapply(seq_along(sheets), function(x) 5)
        skipValues <- c(6, 6, 6)

        tmp <- parseFile(destfile, nameCols, skipValues)

    } else if (subFileName %in% c("sdds-monthly-2010-2020", "sdds-monthly-2000-2009")) {

        nameCols <- list(5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5)
        skipValues <- c(6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6)

        tmp <- parseFile(destfile, nameCols, skipValues)

    }

    if (subFileName == "sdds-monthly") {

        sheets <- excel_sheets(destfile)

        for (ii in seq_along(tmp)) {

            colnames(tmp[[ii]])[7:9] <- paste(c("Jun", "Jul", "Aug"), gsub("SDDS_\\d{2}(\\d{2})", "\\1", sheets[[ii]]), sep = "_")

        }
    }

    tmp

}
