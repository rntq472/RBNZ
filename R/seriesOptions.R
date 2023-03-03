


getDefaultOption <- function(series)
    names(seriesOptions(series))[[1]]

allowedOptions <- function(series)
    names(seriesOptions(series))

seriesOptions <- function(series) {

    allSeries <- list(
        B1 = list(daily = c("hb1-daily-1973-1998", "hb1-daily-1999-2017", "hb1-daily"),
                  monthly = c("hb1-monthly-1973-1998", "hb1-monthly")
                  ),
        B2 = list(dailyclose = c("hb2-daily-close-1985-2017", "hb2-daily-close"),
                  monthlyclose = c("hb2-monthly-close")
        ),
        B3 = list(default = "hb3"),
        B4 = list(NZD = "hb4nzd",
                  USD = "hb4usd",
                  EUR = "hb4eur"),
        B6 = list(default = "hb6"),
        B7 = list(default = "hb7"),
        B10 = list(default = "hb10"),
        B13 = list(default = c("hb13-1983-to-1998", "hb13-1999-to-2014", "hb13")),
        B20 = list(default = "hb20"),
        B21 = list(default = "hb21"),
        B25 = list(default = "hb25"),
        B26 = list(default = "hb26"),
        B27 = list(default = "hb27"),
        B30 = list(default = "hb30"),

        C5 = list(default = "hc5"),
        C12 = list(monthend = "hc12-month-end",
                   dailyaverage = "hc12-daily-average-balances"),
        C13 = list(issued = "hc13-issued-in-nz",
                   used = "hc13-used-in-nz"),
        C21 = list(default = "hc21"),
        C22 = list(default = "hc22"),
        C30 = list(default = "hc30"),
        C31 = list(default = "hc31"),
        C32 = list(default = "hc32"),
        C33 = list(default = "hc33"),
        C35 = list(default = "hc35"),
        C40 = list(default = "hc40"),
        C41 = list(default = "hc41"),
        C50 = list(default = "hc50",
                   longrun = "hc50-long-run"),
        C51 = list(default = "hc51"),
        C52 = list(default = "hc52"),
        C55 = list(default = "hc55"),
        C60 = list(default = "hc60"), ## ec60 not returned.
        C65 = list(default = "hc65"),
        C66 = list(default = "hc66"),
        C70 = list(default = "hc70"),
        C71 = list(default = "hc71"),

        D3 = list(default = "hd3"),
        D9 = list(weekly = "hd9-weekly",
                  monthly = "hd9-monthly"),
        D10 = list(default = "hd10"),
        D12 = list(default = "hd12"),
        D30 = list(default = "hd30"), ## Ignores concordance file
        D31 = list(default = "hd31"), ## Ignores concordance file
        D35 = list(default = "hd35"), ## Ignores concordance file

        E1 = list(default = "he1"),
        E2 = list(default = "he2"),

        F3 = list(default = "hf3"),
        F4 = list(default = "hf4"),
        F5 = list(default = "hf5"),

        H1 = list(default = "hh1"),
        H2 = list(default = "hh2"),
        H3 = list(default = "hh3"),

        J10 = list(default = "hj10"),
        J20 = list(default = "hj20"),

        L1 = list(default = "hl1"),
        L2 = list(default = "hl2"),
        L3 = list(default = "hl3"),

        M1 = list(default = "hm1",
                  longrun = "hm1-long"),
        M2 = list(default = "hm2"),
        M3 = list(default = "hm3"),
        M4 = list(default = "hm4"),
        M5 = list(default = "hm5"),
        M6 = list(default = "hm6"),
        M7 = list(default = "hm7"),
        M8 = list(default = "hm8"),
        M9 = list(default = "hm9"),
        M10 = list(default = "hm10"),
        M12 = list(default = "hm12"),
        M14 = list(default = "hm14"),
        M15 = list(default = "hm15"),

        R1 = list(default = "hr1"),
        R2 = list(default = "hr2"),
        R3 = list(default = "hr3"),

        S10 = list(default = "hs10",
                   longrun = "hs10-long-run",
                   moredetail = "hs10m"),
        S20 = list(default = "hs20"),
        S21 = list(default = "hs21"),
        S30 = list(default = "hs30"),
        S31 = list(default = "hs31"),
        S32 = list(default = "hs32"),
        S33 = list(default = "hs33",
                   longrun = "hs33-long-run"),
        S34 = list(default = "hs34"),
        S35 = list(default = "hs35"),
        S36 = list(default = "hs36"),
        S37 = list(default = "hs37"),
        S40 = list(default = "hs40",
                   longrun = "hs40-long-run"),
        S41 = list(default = "hs41"),
        S42 = list(default = "hs42"),
        S45 = list(default = "hs45",
                   total = "hs45t"),
        S46 = list(default = "hs46",
                   average = "hs46a",
                   total = "hs46t"),
        S50 = list(default = "hs50",
                   longrun = "hs50-long-run"),
        S51 = list(default = "hs51"),

        SDDS = list(default = c("sdds-monthly-2000-2009", "sdds-monthly-2010-2020", "sdds-monthly")),

        T1 = list(default = "ht1"),
        T4 = list(default = "ht4"),
        T11 = list(default = "ht11"),
        T21 = list(default = "ht21"),
        T31 = list(default = "ht31"),
        T40 = list(default = "ht40"),
        T41 = list(default = "ht41"),
        T42 = list(default = "ht42"),
        T43 = list(default = "ht43"),
        T44 = list(default = "ht44"),
        T45 = list(default = "ht45"),
        T46 = list(default = "ht46"),
        T47 = list(default = "ht47"),
        T48 = list(default = "ht48")
    )

    if (missing(series)) {
        allSeries
    } else {
        allSeries[[series]]
    }

}
