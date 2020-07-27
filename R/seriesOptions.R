


getDefaultOption <- function(series)
    names(seriesOptions(series))[1]

allowedOptions <- function(series)
    names(seriesOptions(series))

seriesOptions <- function(series){

    allSeries <- list(
        B1 = list(daily = c('hb1-daily-1973-1998', 'hb1-daily-1999-2017', 'hb1-daily'),
                  monthly = c('hb1-monthly-1973-1998', 'hb1-monthly')
                  ),
        B4 = list(NZD = 'hb4nzd',
                  USD = 'hb4usd',
                  EUR = 'hb4eur'),
        B2 = list(daily = c('hb2-daily-1985-2017', 'hb2-daily'),
                  dailyclose = c('hb2dailyclose2010-2017', 'hb2-daily-close'),
                  monthly = c('hb2-monthly'),
                  monthlyclose = c('hb2-monthly-close')
                  ),
        B3 = list(default = 'hb3'),
        B6 = list(default = 'hb6'),
        B20 = list(default = 'hB20'),
        B21 = list(default = 'hB21'),
        B25 = list(default = 'hB25'),
        B26 = list(default = 'hB26'),
        B27 = list(default = 'hB27'),
        B10 = list(default = 'hb10'),
        B13 = list(default = c('hb13-1983-to-1998', 'hb13-1999-to-2014', 'hb13')),
        C5 = list(default = 'hc5'),
        C12 = list(monthend = 'hc12-month-end',
                   dailyaverage = 'hc12-daily-average-balances'),
        C13 = list(issued = 'hc13-issued-in-nz',
                   used = 'hc13-used-in-nz'),
        C30 = list(default = 'hc30',
                   longrun = 'hC30-long-run'),
        C31 = list(default = 'hc31'),
        C32 = list(default = 'hc32'),
        C35 = list(default = 'hc35'),
        C40 = list(default = 'hC40'),
        C41 = list(default = 'hC41'),
        C50 = list(default = 'hC50',
                   longrun = 'hC50-long-run'),
        C51 = list(default = 'hC51'),
        C52 = list(default = 'hC52'),
        C55 = list(default = 'hC55'),
        C60 = list(default = 'hc60'), ## ec60 not returned.
        C65 = list(default = 'hc65'),
        C66 = list(default = 'hc66'),
        D3 = list(default = 'hd3'),
        D10 = list(default = 'hd10'),
        D12 = list(default = 'hd12'),
        F5 = list(default = 'hf5'),
        R1 = list(default = 'hr1'),
        R2 = list(default = 'hr2'),
        R3 = list(default = 'hr3'),
        F3 = list(default = 'hf3'),
        F4 = list(default = 'hf4'),
        S10 = list(default = 'hS10',
                   moredetail = 'hS10M'),
        S30 = list(default = 'hS30'),
        S31 = list(default = 'hS31'),
        S32 = list(default = 'hS32'),
        S33 = list(default = 'hS33',
                   longrun = 'hS33-long-run'),
        S34 = list(default = 'hS34'),
        S40 = list(default = 'hS40',
                   longrun = 'hS40-long-run'),
        S41 = list(default = 'hS41'),
        S20 = list(default = 'hs20'),
        S21 = list(default = 'hs21'),
        L1 = list(default = 'hl1'),
        L2 = list(default= 'hl2'),
        L3 = list(default = 'hl3'),
        J10 = list(default = 'hj10'),
        J20 = list(default = 'hj20'),
        T1 = list(default = 'ht1'),
        T4 = list(default = 'ht4'),
        T11 = list(default = 'ht11'),
        T21 = list(default = 'ht21'),
        T31 = list(default = 'ht31'),
        T40 = list(default = 'ht40'),
        T41 = list(default = 'ht41'),
        T42 = list(default = 'ht42'),
        T43 = list(default = 'ht43'),
        T44 = list(default = 'ht44'),
        T45 = list(default = 'ht45'),
        T46 = list(default = 'ht46'),
        T47 = list(default = 'ht47'),
        T48 = list(default = 'ht48'),
        C21 = list(default = 'hc21'),
        C22 = list(default = 'hc22'),
        D9 = list(weekly = 'hD9-weekly',
                  monthly = 'hD9-monthly'),
        D30 = list(default = 'hD30'), ## Ignores concordance file
        D31 = list(default = 'hD31'), ## Ignores concordance file
        D35 = list(default = 'hD35'), ## Ignores concordance file
        M1 = list(default = 'hm1',
                  longrun = 'hm1-long'),
        M2 = list(default = 'hm2'),
        M3 = list(default = 'hm3'),
        M4 = list(default = 'hm4'),
        M5 = list(default = 'hm5'),
        M6 = list(default = 'hm6'),
        M7 = list(default = 'hm7'),
        M8 = list(default = 'hm8'),
        M9 = list(default = 'hm9'),
        M10 = list(default = 'hm10'),
        M12 = list(default = 'hm12'),
        M13 = list(default = 'hm13'),
        M14 = list(default = 'hm14'),
        E1 = list(default = 'he1'),
        E2 = list(default = 'he2'),
        SDDS = list(current = 'current')
    )
    
    if (missing(series) ){
        allSeries
    } else {
        allSeries[[series]]
    }
    
}
