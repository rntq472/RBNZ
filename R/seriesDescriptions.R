##' B1 - Exchange rates and TWI
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/b1} for a full description.
##' 
##' @name B1
##' 
##' @param option Allowed values are "daily" (default) and "monthly".
##' 
##' @note The historical data is split across multiple files at source. We download
##'       all of them and merge together to form a complete history.
##'
##' @keywords internal
##' 
NULL

##' B4 - Foreign exchange turnover ($m daily averages)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b4} for a full description.
##' 
##' @name B4
##' 
##' @param option Allowed values are "NZD" (default), "USD" and "EUR".
##' 
##' @keywords internal
##' 
NULL

##' B2 - Wholesale interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b2} for a full description.
##' 
##' @name B2
##' 
##' @param option Allowed values are "daily" (default), "dailyclose", "monthly", and
##'               "monthlyclose".
##'
##' @note The historical data is split across multiple files at source. We download
##'       all of them and merge together to form a complete history.
##' 
##' @keywords internal
##' 
NULL

##' B3 - Retail interest rates on lending and deposits
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b3} for a full description.
##' 
##' @name B3
##' 
##' @keywords internal
##' 
NULL

##' B6 - Yields on loans
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b6-yields-on-loans} for a full
##' description.
##' 
##' @name B6
##' 
##' @keywords internal
##' 
NULL

##' B20 - New residential mortgage standard interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b20-new-customer-average-rate}
##' for a full description.
##' 
##' @name B20
##' 
##' @keywords internal
##' 
NULL

##' B21 - New residential mortgage special interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b21-new-residential-mortgage-special-interest-rates}
##' for a full description.
##' 
##' @name B21
##' 
##' @keywords internal
##' 
NULL

##' B25 - New interest bearing call savings account interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b25-new-interest-bearing-call-savings-account-interest-rates}
##' for a full description.
##' 
##' @name B25
##' 
##' @keywords internal
##' 
NULL

##' B26 - New interest bearing term deposit interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b26-new-interest-bearing-term-deposit-interest-rates}
##' for a full description.
##' 
##' @name B26
##' 
##' @keywords internal
##' 
NULL

##' B27 - New interest bearing term PIE deposits interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b27-new-interest-bearing-term-pie-deposits-interest-rates}
##' for a full description.
##' 
##' @name B27
##' 
##' @keywords internal
##' 
NULL

##' B10 - TWI weights
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b10} for a full description.
##' 
##' @name B10
##' 
##' @keywords internal
##' 
NULL

##' B13 - Historical TWI weights
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b13} for a full description.
##' 
##' @name B13
##'
##' @note The historical data is split across multiple files at source. We download
##'       all of them and merge together into a single data frame, but note that
##'       unlike with most of the other series available here it is not a simple
##'       matter of rbind-ing all the data together. The composition of the TWI
##'       changed in December 2014 but there were some components that were present
##'       both before and after, for example Australia. These are returned as
##'       separate fields in the output rather than combining them into a single
##'       entry. 
##' 
##' @keywords internal
##' 
NULL

##' C5 - Sector lending (registered banks and non-bank lending institutions)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c5} for a full description.
##' 
##' @name C5
##' 
##' @keywords internal
##' 
NULL

##' C12 - Credit card balances
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c12} for a full description.
##' 
##' @name C12
##' 
##' @param option Allowed values are "monthend" (default) and "dailyaverage".
##' 
##' @keywords internal
##' 
NULL

##' C13 - Credit card spending
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c13} for a full description.
##' 
##' @name C13
##' 
##' @param option Allowed values are "issued" (default) and "used".
##' 
##' @keywords internal
##' 
NULL

##' C30 - New residential mortgage lending by loan-to-valuation ratio (LVR)
##' compliance data
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c30} for a full description.
##' 
##' @name C30
##' 
##' @param option Allowed values are "default" (default) and "longrun".
##'
##' @note There are a few other files present on the webpage for this series but
##'       they are not downloaded. You will need to retrieve them manually if you
##'       want them.
##' 
##' @keywords internal
##' 
NULL

##' C31 - New residential mortgage lending by borrower type
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c31} for a full description.
##' 
##' @name C31
##' 
##' @keywords internal
##' 
NULL

##' C32 - New and Existing Residential Mortgage Lending by Payment type
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c32} for a full description.
##' 
##' @name C32
##' 
##' @keywords internal
##' 
NULL

##' C35 - Residential mortgage loan reconciliation
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c35} for a full description.
##' 
##' @name C35
##' 
##' @keywords internal
##' 
NULL

##' C40 - Residential mortgage lending by debt-to-income (DTI) purpose use
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c40-residential-mortgage-lending-by-debt-to-income-dti-purpose-use}
##' for a full description.
##' 
##' @name C40
##' 
##' @keywords internal
##' 
NULL

##' C41 - Residential mortgage borrower gross income (BGI)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c41-residential-mortgage-borrower-gross-income-bgi}
##' for a full description.
##' 
##' @name C41
##' 
##' @keywords internal
##' 
NULL

##' C50 - Money and credit aggregates (depository corporations)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c50-money-and-credit-aggregates}
##' for a full description.
##' 
##' @name C50
##' 
##' @param option Allowed values are "default" (default) and "longrun".
##' 
##' @keywords internal
##' 
NULL

##' C51 - Other depository corporations analytical accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c51-other-depository-corporations-analytical-accounts} for a full description.
##' 
##' @name C51
##' 
##' @keywords internal
##' 
NULL

##' C52 - Depository corporations analytical accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c52-depository-corporations-analytical-accounts} for a full description.
##' 
##' @name C52
##' 
##' @keywords internal
##' 
NULL

##' C55 - Other financial corporations analytical accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c55-other-financial-corporations-analytical-accounts} for a full description.
##' 
##' @name C55
##' 
##' @keywords internal
##' 
NULL

##' C60 - Credit conditions survey
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c60-credit-conditions-survey}
##' for a full description.
##' 
##' @name C60
##'
##' @note There is a second dataset present (the ec60 file) which is not retrieved
##'       as it is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' D3 - Open market operations
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d3} for a full description.
##' 
##' @name D3
##'
##' @note This data is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' D10 - Influences on settlement cash
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d10} for a full description.
##' 
##' @name D10
##'
##' @note This data is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' D12 - Standing facilities
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d12} for a full description.
##' 
##' @name D12
##'
##' @note This data is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' F5 - Reserve Bank foreign currency assets and liabilities
##'
##' See \url{https://www.rbnz.govt.nz/statistics/f5} for a full description.
##' 
##' @name F5
##'
##' @note This data is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' R1 - Reserve Bank balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/r1} for a full description.
##' 
##' @name R1
##' 
##' @keywords internal
##' 
NULL

##' R2 - Reserve Bank statistical balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/r2} for a full description.
##' 
##' @name R2
##' 
##' @keywords internal
##' 
NULL

##' R3 - Reserve Bank analytical accounts ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/r3} for a full description.
##' 
##' @name R3
##' 
##' @keywords internal
##' 
NULL

##' F3 - Bank notes in the hands of the public
##'
##' See \url{https://www.rbnz.govt.nz/statistics/f3} for a full description.
##' 
##' @name F3
##'
##' @note This data is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' F4 - Coin mintings
##'
##' See \url{https://www.rbnz.govt.nz/statistics/f4} for a full description.
##' 
##' @name F4
##'
##' @note This data is in a non-standard format.
##' 
##' @keywords internal
##' 
NULL

##' S10 - Banks: Balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s10-banks-balance-sheet} for
##' a full description.
##' 
##' @name S10
##' 
##' @param option Allowed values are "default" (default) and "moredetail".
##' 
##' @keywords internal
##' 
NULL

##' S30 - Banks: Assets - Loans by sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s30-banks-assets-loans-by-sector}
##' for a full description.
##' 
##' @name S30
##' 
##' @keywords internal
##' 
NULL

##' S31 - Banks: Assets – Loans by purpose ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s31-banks-assets-loans-by-purpose}
##' for a full description.
##' 
##' @name S31
##' 
##' @keywords internal
##' 
NULL

##' S32 - Banks: Assets – Loans by product ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s32-banks-assets-loans-by-product}
##' for a full description.
##' 
##' @name S32
##' 
##' @keywords internal
##' 
NULL

##' S33 - Banks: Assets – Loans fully secured by residential mortgage by repricing ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s33-banks-assets-loans-fully-secured-by-residential-mortgage-by-repricing}
##' for a full description.
##' 
##' @name S33
##' 
##' @param option Allowed values are "default" (default) and "longrun".
##' 
##' @keywords internal
##' 
NULL

##' S34 - Banks: Assets – Loans and Repos by Industry ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s34-banks-assets-loans-by-industry}
##' for a full description.
##' 
##' @name S34
##' 
##' @keywords internal
##' 
NULL

##' S40 - Banks: Liabilities – Deposits by sector ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s40-banks-liabilities-deposits-by-sector}
##' for a full description.
##' 
##' @name S40
##' 
##' @param option Allowed values are "default" (default) and "longrun".
##' 
##' @keywords internal
##' 
NULL

##' S41 - Banks: Liabilities – Deposits by industry ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s41-banks-liabilities-deposits-by-industry}
##' for a full description.
##' 
##' @name S41
##' 
##' @keywords internal
##' 
NULL

##' S20 - Banks: Summary income statement and related ratios
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s20} for a full description.
##' 
##' @name S20
##' 
##' @keywords internal
##' 
NULL

##' S21 - Banks: Income statement ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s21} for a full description.
##' 
##' @name S21
##' 
##' @keywords internal
##' 
NULL

##' L1 - Mismatch ratios
##'
##' See \url{https://www.rbnz.govt.nz/statistics/l1} for a full description.
##' 
##' @name L1
##' 
##' @keywords internal
##' 
NULL

##' L2 - Core funding ratio
##'
##' See \url{https://www.rbnz.govt.nz/statistics/l2} for a full description.
##' 
##' @name L2
##' 
##' @keywords internal
##' 
NULL

##' L3 - Face value of funding by residual maturity ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/l3} for a full description.
##' 
##' @name L3
##' 
##' @keywords internal
##' 
NULL

##' J10 - Insurance: Income Statement
##'
##' See \url{https://www.rbnz.govt.nz/statistics/j10-insurance-income-statement}
##' for a full description.
##' 
##' @name J10
##' 
##' @keywords internal
##' 
NULL

##' J20 - Insurance: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/j20-insurance-balance-sheet}
##' for a full description.
##' 
##' @name J20
##' 
##' @keywords internal
##' 
NULL

##' T1 - Non banks: Balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t1} for a full description.
##' 
##' @name T1
##' 
##' @keywords internal
##' 
NULL

##' T4 - Non banks: Funding and claims by sector ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t4} for a full description.
##' 
##' @name T4
##' 
##' @keywords internal
##' 
NULL

##' T11 - Savings institutions: Balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t11} for a full description.
##' 
##' @name T11
##' 
##' @keywords internal
##' 
NULL

##' T21 - Deposit taking finance companies: Balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t21} for a full description.
##' 
##' @name T21
##' 
##' @keywords internal
##' 
NULL

##' T31 - Non-deposit taking finance companies: Balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t31} for a full description.
##' 
##' @name T31
##' 
##' @keywords internal
##' 
NULL

##' T40 - Funds under management ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t40} for a full description.
##' 
##' @name T40
##' 
##' @keywords internal
##' 
NULL

##' T41 - Managed fund assets ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t41} for a full description.
##' 
##' @name T41
##' 
##' @keywords internal
##' 
NULL

##' T42 - Life insurance ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t42} for a full description.
##' 
##' @name T42
##' 
##' @keywords internal
##' 
NULL

##' T43 - KiwiSaver ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t43} for a full description.
##' 
##' @name T43
##' 
##' @keywords internal
##' 
NULL

##' T44 - Other registered superannuation ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t44} for a full description.
##' 
##' @name T44
##' 
##' @keywords internal
##' 
NULL

##' T45 - Retail unit trusts ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t45} for a full description.
##' 
##' @name T45
##'  
##' @keywords internal
##' 
NULL

##' T46 - Cash management trusts ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t46} for a full description.
##' 
##' @name T46
##' 
##' @keywords internal
##' 
NULL

##' T47 - Wholesale trusts ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t47} for a full description.
##' 
##' @name T47
##' 
##' @keywords internal
##' 
NULL

##' T48 - Wholesale trusts and other funds ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t48} for a full description.
##' 
##' @name T48
##' 
##' @keywords internal
##' 
NULL

##' C21 - Key household financial statistics ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c21} for a full description.
##' 
##' @name C21
##' 
##' @keywords internal
##' 
NULL

##' C22 - Household balance sheet ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c22} for a full description.
##' 
##' @name C22
##' 
##' @keywords internal
##' 
NULL

##' D9 - Government bond turnover
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d9} for a full description.
##' 
##' @name D9
##'
##' @param option Allowed values are "daily" (default) and "monthly".
##' 
##' @keywords internal
##' 
NULL

##' D30 - Holdings of central government debt securities (nominal value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d30} for a full description.
##' 
##' @name D30
##' 
##' @keywords internal
##' 
NULL

##' D31 - Non-resident holdings of individual bonds (nominal value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d31} for a full description.
##' 
##' @name D31
##' 
##' @keywords internal
##' 
NULL

##' D35 - Holdings of Kauri bonds (nominal value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d35} for a full description.
##' 
##' @name D35
##' 
##' @keywords internal
##' 
NULL

##' M1 - Prices
##'
##' See \url{https://www.rbnz.govt.nz/statistics/m1} for a full description.
##' 
##' @name M1
##' 
##' @param option Allowed values are "default" (default) and "longrun".
##' 
##' @keywords internal
##' 
NULL

##' M2 - Consumption
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m2} for a full description.
##' 
##' @name M2
##' 
##' @keywords internal
##' 
NULL

##' M3 - Investment
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m3} for a full description.
##' 
##' @name M3
##' 
##' @keywords internal
##' 
NULL

##' M4 - Domestic trade
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m4} for a full description.
##' 
##' @name M4
##' 
##' @keywords internal
##' 
NULL

##' M5 - Gross Domestic Product
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m5} for a full description.
##' 
##' @name M5
##' 
##' @keywords internal
##' 
NULL

##' M6 - National saving (year ended March)
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m6} for a full description.
##' 
##' @name M6
##' 
##' @keywords internal
##' 
NULL

##' M7 - Balance of Payments and International Investment Position
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m7} for a full description.
##' 
##' @name M7
##' 
##' @keywords internal
##' 
NULL

##' M8 - Overseas trade
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m8} for a full description.
##' 
##' @name M8
##' 
##' @keywords internal
##' 
NULL

##' M9 - Labour market
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m9} for a full description.
##' 
##' @name M9
##' 
##' @keywords internal
##' 
NULL

##' M10 - Housing
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m10} for a full description.
##' 
##' @name M10
##' 
##' @keywords internal
##' 
NULL

##' M12 - Population and migration
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m12} for a full description.
##' 
##' @name M12
##' 
##' @keywords internal
##' 
NULL

##' M13 - Household inflation expectations
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m13} for a full description.
##' 
##' @name M13
##' 
##' @keywords internal
##' 
NULL

##' M14 - Survey of expectations
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m14} for a full description.
##' 
##' @name M14
##' 
##' @keywords internal
##' 
NULL

##' E1 - New Zealand's official overseas reserves
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/e1} for a full description.
##' 
##' @name E1
##' 
##' @keywords internal
##' 
NULL

##' E2 - New Zealand's position with the IMF
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/e2} for a full description.
##' 
##' @name E2
##' 
##' @keywords internal
##' 
NULL

##' SDDS - NZ’s international reserves and foreign currency liquidity
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/sdds} for a full description.
##' 
##' @name SDDS
##'
##' @param option Allowed values are "current" (default) and a year and month
##'               specified in the form "20nn-nn".
##' 
##' @note This is a non-standard dataset.
##' 
##' @keywords internal
##' 
NULL
