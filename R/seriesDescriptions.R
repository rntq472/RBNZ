##' Exchange Rates and TWI
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/b1} for a full description.
##' 
##' @name B1
##' 
##' @param option Allowed values are \dQuote{daily} (default) and \dQuote{monthly}.
##' 
##' @note The historical data is split across multiple files at source. We download
##'       all of them and merge together to form a complete history.
##'
##' @keywords internal
##' 
NULL

##' Foreign Exchange Turnover
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b4} for a full description.
##' 
##' @name B4
##' 
##' @param option Allowed values are \dQuote{NZD} (default), \dQuote{USD}
##'               and \dQuote{EUR}.
##' 
##' @keywords internal
##' 
NULL

##' Wholesale Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b2} for a full description.
##' 
##' @name B2
##' 
##' @param option Allowed values are \dQuote{daily} (default), \dQuote{dailyclose},
##'               \dQuote{monthly}, and \dQuote{monthlyclose}.
##'
##' @note The historical data is split across multiple files at source. We download
##'       all of them and merge together to form a complete history.
##' 
##' @keywords internal
##' 
NULL

##' Retail Interest Rates on Lending and Deposits
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b3} for a full description.
##' 
##' @name B3
##' 
##' @keywords internal
##' 
NULL

##' Yields on Loans
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b6-yields-on-loans} for a full
##' description.
##' 
##' @name B6
##' 
##' @keywords internal
##' 
NULL

##' New Residential Mortgage Standard Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b20-new-customer-average-rate}
##' for a full description.
##' 
##' @name B20
##' 
##' @keywords internal
##' 
NULL

##' New Residential Mortgage Special Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b21-new-residential-mortgage-special-interest-rates}
##' for a full description.
##' 
##' @name B21
##' 
##' @keywords internal
##' 
NULL

##' New Interest Bearing Call Savings Account Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b25-new-interest-bearing-call-savings-account-interest-rates}
##' for a full description.
##' 
##' @name B25
##' 
##' @keywords internal
##' 
NULL

##' New Interest Bearing Term Deposit Interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b26-new-interest-bearing-term-deposit-interest-rates}
##' for a full description.
##' 
##' @name B26
##' 
##' @keywords internal
##' 
NULL

##' New Interest Bearing Term PIE Deposits Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b27-new-interest-bearing-term-pie-deposits-interest-rates}
##' for a full description.
##' 
##' @name B27
##' 
##' @keywords internal
##' 
NULL

##' TWI Weights
##'
##' See \url{https://www.rbnz.govt.nz/statistics/b10} for a full description.
##' 
##' @name B10
##' 
##' @keywords internal
##' 
NULL

##' Historical TWI Weights
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

##' Sector Lending
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c5} for a full description.
##' 
##' @name C5
##' 
##' @keywords internal
##' 
NULL

##' Credit Card Balances
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c12} for a full description.
##' 
##' @name C12
##' 
##' @param option Allowed values are \dQuote{monthend} (default) and
##'               \dQuote{dailyaverage}.
##' 
##' @keywords internal
##' 
NULL

##' Credit Card Spending
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c13} for a full description.
##' 
##' @name C13
##' 
##' @param option Allowed values are \dQuote{issued} (default) and \dQuote{used}.
##' 
##' @keywords internal
##' 
NULL

##' New Residential Mortgage Lending by Loan-To-Valuation Ratio
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c30} for a full description.
##' 
##' @name C30
##' 
##' @param option Allowed values are \dQuote{default} (default) and \dQuote{longrun}.
##'
##' @note There are a few other files present on the webpage for this series but
##'       they are not downloaded. You will need to retrieve them manually if you
##'       want them.
##' 
##' @keywords internal
##' 
NULL

##' New Residential Mortgage Lending by Borrower Type
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c31} for a full description.
##' 
##' @name C31
##' 
##' @keywords internal
##' 
NULL

##' New and Existing Residential Mortgage Lending by Payment Type
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c32} for a full description.
##' 
##' @name C32
##' 
##' @keywords internal
##' 
NULL

##' Residential Mortgage Loan Reconciliation
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c35} for a full description.
##' 
##' @name C35
##' 
##' @keywords internal
##' 
NULL

##' Residential Mortgage Lending by Debt-To-Income Purpose Use
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c40-residential-mortgage-lending-by-debt-to-income-dti-purpose-use}
##' for a full description.
##' 
##' @name C40
##' 
##' @keywords internal
##' 
NULL

##' Residential Mortgage Borrower Gross Income (BGI)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c41-residential-mortgage-borrower-gross-income-bgi}
##' for a full description.
##' 
##' @name C41
##' 
##' @keywords internal
##' 
NULL

##' Money and Credit Aggregates (Depository Corporations)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c50-money-and-credit-aggregates}
##' for a full description.
##' 
##' @name C50
##' 
##' @param option Allowed values are \dQuote{default} (default) and \dQuote{longrun}.
##' 
##' @keywords internal
##' 
NULL

##' Other Depository Corporations Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c51-other-depository-corporations-analytical-accounts} for a full description.
##' 
##' @name C51
##' 
##' @keywords internal
##' 
NULL

##' Depository Corporations Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c52-depository-corporations-analytical-accounts} for a full description.
##' 
##' @name C52
##' 
##' @keywords internal
##' 
NULL

##' Other Financial Corporations Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c55-other-financial-corporations-analytical-accounts} for a full description.
##' 
##' @name C55
##' 
##' @keywords internal
##' 
NULL

##' Credit Conditions Survey
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

##' Open Market Operations
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

##' Influences on Settlement Cash
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

##' Standing Facilities
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

##' Reserve Bank Foreign Currency Assets and Liabilities
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

##' Reserve Bank Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/r1} for a full description.
##' 
##' @name R1
##' 
##' @keywords internal
##' 
NULL

##' Reserve Bank Statistical Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/r2} for a full description.
##' 
##' @name R2
##' 
##' @keywords internal
##' 
NULL

##' Reserve Bank Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/r3} for a full description.
##' 
##' @name R3
##' 
##' @keywords internal
##' 
NULL

##' Bank Notes in the Hands of the Public
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

##' Coin Mintings
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

##' Banks: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s10-banks-balance-sheet} for
##' a full description.
##' 
##' @name S10
##' 
##' @param option Allowed values are \dQuote{default} (default) and
##'               \dQuote{moredetail}.
##' 
##' @keywords internal
##' 
NULL

##' Banks: Assets - Loans by Sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s30-banks-assets-loans-by-sector}
##' for a full description.
##' 
##' @name S30
##' 
##' @keywords internal
##' 
NULL

##' Banks: Assets – Loans by Purpose
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s31-banks-assets-loans-by-purpose}
##' for a full description.
##' 
##' @name S31
##' 
##' @keywords internal
##' 
NULL

##' Banks: Assets – Loans by Product
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s32-banks-assets-loans-by-product}
##' for a full description.
##' 
##' @name S32
##' 
##' @keywords internal
##' 
NULL

##' Banks: Assets – Loans Fully Secured by Residential Mortgage
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s33-banks-assets-loans-fully-secured-by-residential-mortgage-by-repricing}
##' for a full description.
##' 
##' @name S33
##' 
##' @param option Allowed values are \dQuote{default} (default) and \dQuote{longrun}.
##' 
##' @keywords internal
##' 
NULL

##' Banks: Assets – Loans and Repos by Industry
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s34-banks-assets-loans-by-industry}
##' for a full description.
##' 
##' @name S34
##' 
##' @keywords internal
##' 
NULL

##' Banks: Liabilities – Deposits by Sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s40-banks-liabilities-deposits-by-sector}
##' for a full description.
##' 
##' @name S40
##' 
##' @param option Allowed values are \dQuote{default} (default) and \dQuote{longrun}.
##' 
##' @keywords internal
##' 
NULL

##' Banks: Liabilities – Deposits by Industry
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s41-banks-liabilities-deposits-by-industry}
##' for a full description.
##' 
##' @name S41
##' 
##' @keywords internal
##' 
NULL

##' Banks: Summary Income Statement and Related Ratios
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s20} for a full description.
##' 
##' @name S20
##' 
##' @keywords internal
##' 
NULL

##' Banks: Income Statement
##'
##' See \url{https://www.rbnz.govt.nz/statistics/s21} for a full description.
##' 
##' @name S21
##' 
##' @keywords internal
##' 
NULL

##' Mismatch Ratios
##'
##' See \url{https://www.rbnz.govt.nz/statistics/l1} for a full description.
##' 
##' @name L1
##' 
##' @keywords internal
##' 
NULL

##' Core Funding Ratio
##'
##' See \url{https://www.rbnz.govt.nz/statistics/l2} for a full description.
##' 
##' @name L2
##' 
##' @keywords internal
##' 
NULL

##' Face Value of Funding by Residual Maturity ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/l3} for a full description.
##' 
##' @name L3
##' 
##' @keywords internal
##' 
NULL

##' Insurance: Income Statement
##'
##' See \url{https://www.rbnz.govt.nz/statistics/j10-insurance-income-statement}
##' for a full description.
##' 
##' @name J10
##' 
##' @keywords internal
##' 
NULL

##' Insurance: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/j20-insurance-balance-sheet}
##' for a full description.
##' 
##' @name J20
##' 
##' @keywords internal
##' 
NULL

##' Non Banks: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t1} for a full description.
##' 
##' @name T1
##' 
##' @keywords internal
##' 
NULL

##' Non Banks: Funding and Claims by Sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t4} for a full description.
##' 
##' @name T4
##' 
##' @keywords internal
##' 
NULL

##' Savings Institutions: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t11} for a full description.
##' 
##' @name T11
##' 
##' @keywords internal
##' 
NULL

##' Deposit Taking Finance Companies: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t21} for a full description.
##' 
##' @name T21
##' 
##' @keywords internal
##' 
NULL

##' Non-Deposit Taking Finance Companies: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t31} for a full description.
##' 
##' @name T31
##' 
##' @keywords internal
##' 
NULL

##' Funds Under Management
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t40} for a full description.
##' 
##' @name T40
##' 
##' @keywords internal
##' 
NULL

##' Managed Fund Assets
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t41} for a full description.
##' 
##' @name T41
##' 
##' @keywords internal
##' 
NULL

##' Life Insurance
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t42} for a full description.
##' 
##' @name T42
##' 
##' @keywords internal
##' 
NULL

##' KiwiSaver
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t43} for a full description.
##' 
##' @name T43
##' 
##' @keywords internal
##' 
NULL

##' Other Registered Superannuation
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t44} for a full description.
##' 
##' @name T44
##' 
##' @keywords internal
##' 
NULL

##' Retail Unit Trusts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t45} for a full description.
##' 
##' @name T45
##'  
##' @keywords internal
##' 
NULL

##' Cash Management Trusts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t46} for a full description.
##' 
##' @name T46
##' 
##' @keywords internal
##' 
NULL

##' Wholesale Trusts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t47} for a full description.
##' 
##' @name T47
##' 
##' @keywords internal
##' 
NULL

##' Wholesale Trusts and Other Funds
##'
##' See \url{https://www.rbnz.govt.nz/statistics/t48} for a full description.
##' 
##' @name T48
##' 
##' @keywords internal
##' 
NULL

##' Key Household Financial Statistics
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c21} for a full description.
##' 
##' @name C21
##' 
##' @keywords internal
##' 
NULL

##' Household Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/c22} for a full description.
##' 
##' @name C22
##' 
##' @keywords internal
##' 
NULL

##' Government Bond Turnover
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d9} for a full description.
##' 
##' @name D9
##'
##' @param option Allowed values are \dQuote{daily} (default) and \dQuote{monthly}.
##' 
##' @keywords internal
##' 
NULL

##' Holdings of Central Government Debt Securities
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d30} for a full description.
##' 
##' @name D30
##' 
##' @keywords internal
##' 
NULL

##' Non-Resident Holdings of Individual Bonds (Nominal Value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d31} for a full description.
##' 
##' @name D31
##' 
##' @keywords internal
##' 
NULL

##' Holdings of Kauri Bonds (Nominal Value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/d35} for a full description.
##' 
##' @name D35
##' 
##' @keywords internal
##' 
NULL

##' Prices
##'
##' See \url{https://www.rbnz.govt.nz/statistics/m1} for a full description.
##' 
##' @name M1
##' 
##' @param option Allowed values are \dQuote{default} (default) and \dQuote{longrun}.
##' 
##' @keywords internal
##' 
NULL

##' Consumption
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m2} for a full description.
##' 
##' @name M2
##' 
##' @keywords internal
##' 
NULL

##' Investment
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m3} for a full description.
##' 
##' @name M3
##' 
##' @keywords internal
##' 
NULL

##' Domestic Trade
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m4} for a full description.
##' 
##' @name M4
##' 
##' @keywords internal
##' 
NULL

##' Gross Domestic Product
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m5} for a full description.
##' 
##' @name M5
##' 
##' @keywords internal
##' 
NULL

##' National Saving (Year Ended March)
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m6} for a full description.
##' 
##' @name M6
##' 
##' @keywords internal
##' 
NULL

##' Balance of Payments and International Investment Position
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m7} for a full description.
##' 
##' @name M7
##' 
##' @keywords internal
##' 
NULL

##' Overseas Trade
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m8} for a full description.
##' 
##' @name M8
##' 
##' @keywords internal
##' 
NULL

##' Labour Market
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m9} for a full description.
##' 
##' @name M9
##' 
##' @keywords internal
##' 
NULL

##' Housing
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m10} for a full description.
##' 
##' @name M10
##' 
##' @keywords internal
##' 
NULL

##' Population and Migration
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m12} for a full description.
##' 
##' @name M12
##' 
##' @keywords internal
##' 
NULL

##' Household Inflation Expectations
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m13} for a full description.
##' 
##' @name M13
##' 
##' @keywords internal
##' 
NULL

##' Survey of Expectations
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/m14} for a full description.
##' 
##' @name M14
##' 
##' @keywords internal
##' 
NULL

##' New Zealand's Official Overseas Reserves
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/e1} for a full description.
##' 
##' @name E1
##' 
##' @keywords internal
##' 
NULL

##' New Zealand's Position with the IMF
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/e2} for a full description.
##' 
##' @name E2
##' 
##' @keywords internal
##' 
NULL

##' NZ's International Reserves and Foreign Currency Liquidity
##' 
##' See \url{https://www.rbnz.govt.nz/statistics/sdds} for a full description.
##' 
##' @name SDDS
##'
##' @param option Allowed values are \dQuote{current} (default) and a year and month
##'               specified in the form \dQuote{20nn-nn}.
##' 
##' @note This is a non-standard dataset.
##' 
##' @keywords internal
##' 
NULL
