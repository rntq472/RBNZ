##' Exchange Rates and TWI
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/exchange-rates-and-the-trade-weighted-index} for a full description.
##'
##' @name B1
##'
##' @param option Allowed values are \dQuote{daily} (default) and \dQuote{monthly}.
##'
##' @note The historical data is split across multiple files at source. We download
##' all of them and merge together to form a complete history.
##'
##' @keywords internal
##'
NULL

##' Wholesale Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/wholesale-interest-rates} for a full description.
##'
##' @name B2
##'
##' @param option Allowed values are \dQuote{daily} (default), \dQuote{dailyclose},
##' \dQuote{monthly}, and \dQuote{monthlyclose}.
##'
##' @note The historical data is split across multiple files at source. We download
##' all of them and merge together to form a complete history.
##'
##' @keywords internal
##'
NULL

##' Retail Interest Rates on Lending and Deposits
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/retail-interest-rates-on-lending-and-deposits} for a full description.
##'
##' @name B3
##'
##' @keywords internal
##'
NULL

##' Foreign Exchange Turnover
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/foreign-exchange-turnover} for a full description.
##'
##' @name B4
##'
##' @param option Allowed values are \dQuote{NZD} (default), \dQuote{USD}
##' and \dQuote{EUR}.
##'
##' @keywords internal
##'
NULL

##' Yields on Loans
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/yields-on-loans} for a full
##' description.
##'
##' @name B6
##'
##' @keywords internal
##'
NULL

##' Costs of Deposits
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/costs-of-deposits} for a full
##' description.
##'
##' @name B7
##'
##' @keywords internal
##'
NULL

##' TWI Weights
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/trade-weighted-index-weights-and-trade-volumes} for a full description.
##'
##' @name B10
##'
##' @keywords internal
##'
NULL

##' Historical TWI Weights
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/trade-weighted-index-historical-weights} for a full description.
##'
##' @name B13
##'
##' @note The historical data is split across multiple files at source. We download
##' all of them and merge together into a single data frame, but note that
##' unlike with most of the other series available here it is not a simple
##' matter of rbind-ing all the data together. The composition of the TWI
##' changed in December 2014 but there were some components that were present
##' both before and after, for example Australia. These are returned as
##' separate fields in the output rather than combining them into a single
##' entry.
##'
##' @keywords internal
##'
NULL

##' New Residential Mortgage Standard Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/new-residential-mortgage-standard-interest-rates}
##' for a full description.
##'
##' @name B20
##'
##' @keywords internal
##'
NULL

##' New Residential Mortgage Special Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/new-residential-mortgage-special-interest-rates}
##' for a full description.
##'
##' @name B21
##'
##' @keywords internal
##'
NULL

##' New Interest Bearing Call Savings Account Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/new-interest-bearing-call-savings-account-interest-rates}
##' for a full description.
##'
##' @name B25
##'
##' @keywords internal
##'
NULL

##' New Interest Bearing Term Deposit Interest rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/new-interest-bearing-term-deposit-interest-rate}
##' for a full description.
##'
##' @name B26
##'
##' @keywords internal
##'
NULL

##' New Interest Bearing Term PIE Deposits Interest Rates
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/exchange-and-interest-rates/new-interest-bearing-term-portfolio-investment-entity-deposit-interest-rates}
##' for a full description.
##'
##' @name B27
##'
##' @keywords internal
##'
NULL

##' Sector Lending
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/registered-banks-and-non-bank-lending-institutions-sector-lending} for a full description.
##'
##' @name C5
##'
##' @keywords internal
##'
NULL

##' Credit Card Balances
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/credit-card-balances} for a full description.
##'
##' @name C12
##'
##' @param option Allowed values are \dQuote{monthend} (default) and
##' \dQuote{dailyaverage}.
##'
##' @keywords internal
##'
NULL

##' Credit Card Spending
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/credit-card-spending} for a full description.
##'
##' @name C13
##'
##' @param option Allowed values are \dQuote{issued} (default) and \dQuote{used}.
##'
##' @keywords internal
##'
NULL

##' Key Household Financial Statistics
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/households/key-household-financial-statistics} for a full description.
##'
##' @name C21
##'
##' @keywords internal
##'
NULL

##' Household Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/households/household-balance-sheet} for a full description.
##'
##' @name C22
##'
##' @keywords internal
##'
NULL

##' New Residential Mortgage Lending by Loan-To-Valuation Ratio
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/new-residential-mortgage-lending-by-loan-to-valuation-ratio} for a full description.
##'
##' @name C30
##'
##' @keywords internal
##'
NULL

##' New Residential Mortgage Lending by Borrower Type
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/new-residential-mortgage-lending-by-borrower-type} for a full description.
##'
##' @name C31
##'
##' @keywords internal
##'
NULL

##' New and Existing Residential Mortgage Lending by Payment Type
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/new-and-existing-residential-mortgage-lending-by-payment-type2} for a full description.
##'
##' @name C32
##'
##' @keywords internal
##'
NULL

##' Residential Mortgage Loan Reconciliation
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/residential-mortgage-loan-reconciliation} for a full description.
##'
##' @name C35
##'
##' @keywords internal
##'
NULL

##' Residential Mortgage Lending by Debt-To-Income Purpose Use
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/residential-mortgage-lending-by-debt-to-income-dti-purpose-use}
##' for a full description.
##'
##' @name C40
##'
##' @keywords internal
##'
NULL

##' Residential Mortgage Borrower Gross Income (BGI)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/residential-mortgage-borrower-gross-income-bgi}
##' for a full description.
##'
##' @name C41
##'
##' @keywords internal
##'
NULL

##' Money and Credit Aggregates (Depository Corporations)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/depository-corporations-money-and-credit-aggregates}
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
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/other-depository-corporations-analytical-accounts} for a full description.
##'
##' @name C51
##'
##' @keywords internal
##'
NULL

##' Depository Corporations Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/depository-corporations-analytical-accounts} for a full description.
##'
##' @name C52
##'
##' @keywords internal
##'
NULL

##' Other Financial Corporations Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/other-financial-corporations-analytical-accounts} for a full description.
##'
##' @name C55
##'
##' @keywords internal
##'
NULL

##' Credit Conditions Survey
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/credit-conditions}
##' for a full description.
##'
##' @name C60
##'
##' @note There is a second dataset present (the ec60 file) which is not retrieved
##' as it is in a non-standard format.
##'
##' @keywords internal
##'
NULL

##' Bank Customer Lending Flows
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/bank-customer-lending-flows}
##' for a full description.
##'
##' @name C65
##'
##' @keywords internal
##'
NULL

##' Bank Customer Lending Stocks
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/lending-and-monetary/bank-customer-lending-stocks}
##' for a full description.
##'
##' @name C66
##'
##' @keywords internal
##'
NULL

##' Open Market Operations
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/open-market-operations} for a full description.
##'
##' @name D3
##'
##' @note This data is in a non-standard format.
##'
##' @keywords internal
##'
NULL

##' Government Bond Turnover
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/new-zealand-debt-securities/government-bond-turnover} for a full description.
##'
##' @name D9
##'
##' @param option Allowed values are \dQuote{daily} (default) and \dQuote{monthly}.
##'
##' @note The historical archive file is not returned as it is in a different format.
##'
##' @keywords internal
##'
NULL

##' Influences on Settlement Cash
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/influences-on-settlement-cash} for a full description.
##'
##' @name D10
##'
##' @note This data is in a non-standard format. The return value is a list containing
##' the fields "C16", which is historical C16 data, and "data", which is the two D10
##' spreadsheets, historical and current, combined together.
##'
##' @keywords internal
##'
NULL

##' Standing Facilities
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/standing-facilities} for a full description.
##'
##' @name D12
##'
##' @note This data is in a non-standard format.
##'
##' @keywords internal
##'
NULL

##' Holdings of Central Government Debt Securities
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/new-zealand-debt-securities/holdings-of-central-government-debt-securities} for a full description.
##'
##' @name D30
##'
##' @keywords internal
##'
NULL

##' Non-Resident Holdings of Individual Bonds (Nominal Value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/new-zealand-debt-securities/non-resident-holdings-of-individual-bonds} for a full description.
##'
##' @name D31
##'
##' @keywords internal
##'
NULL

##' Holdings of Kauri Bonds (Nominal Value)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/new-zealand-debt-securities/holdings-of-kauri-bonds} for a full description.
##'
##' @name D35
##'
##' @keywords internal
##'
NULL

##' New Zealand's Official Overseas Reserves
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/international-position/new-zealands-official-overseas-reserves} for a full description.
##'
##' @name E1
##'
##' @keywords internal
##'
NULL

##' New Zealand's Position with the IMF
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/international-position/new-zealands-position-with-the-international-monetary-fund} for a full description.
##'
##' @name E2
##'
##' @keywords internal
##'
NULL

##' Bank Notes in the Hands of the Public
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/bank-notes-in-the-hands-of-the-public} for a full description.
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
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/coin-mintings} for a full description.
##'
##' @name F4
##'
##' @note This data is in a non-standard format.
##'
##' @keywords internal
##'
NULL

##' Reserve Bank Foreign Currency Assets and Liabilities
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/our-foreign-currency-assets-and-liabilities} for a full description.
##'
##' @name F5
##'
##' @note This data is in a non-standard format.
##'
##' @keywords internal
##'
NULL

##' Household Inflation Expectations
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/households/household-inflation-expectations} for
##' a full description.
##'
##' @name H1
##'
##' @keywords internal
##'
NULL

##' Housing and Employment
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/households/housing-and-employment} for
##' a full description.
##'
##' @name H2
##'
##' @keywords internal
##'
NULL

##' Cash Use
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/households/cash-use} for
##' a full description.
##'
##' @name H3
##'
##' @keywords internal
##'
NULL

##' Insurance: Income Statement
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/insurance-financial-statistics/insurance-income-statement}
##' for a full description.
##'
##' @name J10
##'
##' @keywords internal
##'
NULL

##' Insurance: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/insurance-financial-statistics/insurance-balance-sheet}
##' for a full description.
##'
##' @name J20
##'
##' @keywords internal
##'
NULL

##' Mismatch Ratios
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-mismatch-ratios} for a full description.
##'
##' @name L1
##'
##' @keywords internal
##'
NULL

##' Core Funding Ratio
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-core-funding-ratio} for a full description.
##'
##' @name L2
##'
##' @keywords internal
##'
NULL

##' Face Value of Funding by Residual Maturity ($m)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-face-value-of-funding-by-residual-maturity} for a full description.
##'
##' @name L3
##'
##' @keywords internal
##'
NULL

##' Prices
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/prices} for a full description.
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
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/consumption} for a full description.
##'
##' @name M2
##'
##' @keywords internal
##'
NULL

##' Investment
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/investment} for a full description.
##'
##' @name M3
##'
##' @keywords internal
##'
NULL

##' Domestic Trade
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/domestic-trade} for a full description.
##'
##' @name M4
##'
##' @keywords internal
##'
NULL

##' Gross Domestic Product
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/gross-domestic-product} for a full description.
##'
##' @name M5
##'
##' @keywords internal
##'
NULL

##' National Saving (Year Ended March)
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/national-saving} for a full description.
##'
##' @name M6
##'
##' @keywords internal
##'
NULL

##' Balance of Payments and International Investment Position
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/balance-of-payments-and-international-investment-position} for a full description.
##'
##' @name M7
##'
##' @keywords internal
##'
NULL

##' Overseas Trade
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/overseas-trade} for a full description.
##'
##' @name M8
##'
##' @keywords internal
##'
NULL

##' Labour Market
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/labour-market} for a full description.
##'
##' @name M9
##'
##' @keywords internal
##'
NULL

##' Housing
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/housing} for a full description.
##'
##' @name M10
##'
##' @keywords internal
##'
NULL

##' Population and Migration
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/population-and-migration} for a full description.
##'
##' @name M12
##'
##' @keywords internal
##'
NULL

##' Survey of Expectations
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/economic-indicators/population-and-migration} for a full description.
##'
##' @name M14
##'
##' @keywords internal
##'
NULL

##' Reserve Bank Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/our-balance-sheet} for a full description.
##'
##' @name R1
##'
##' @keywords internal
##'
NULL

##' Reserve Bank Statistical Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/our-statistical-balance-sheet} for a full description.
##'
##' @name R2
##'
##' @keywords internal
##'
NULL

##' Reserve Bank Analytical Accounts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/reserve-bank/our-analytical-accounts} for a full description.
##'
##' @name R3
##'
##' @keywords internal
##'
NULL

##' Banks: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-balance-sheet}
##' for a full description.
##'
##' @name S10
##'
##' @param option Allowed values are \dQuote{default} (default), \dQuote{longrun}, and \dQuote{moredetail}.
##'
##' @keywords internal
##'
NULL

##' Banks: Summary Income Statement and Related Ratios
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-summary-income-statement-and-related-ratios} for a full description.
##'
##' @name S20
##'
##' @keywords internal
##'
NULL

##' Banks: Income Statement
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-income-statement} for a full description.
##'
##' @name S21
##'
##' @keywords internal
##'
NULL

##' Banks: Assets - Loans by Sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-by-sector}
##' for a full description.
##'
##' @name S30
##'
##' @keywords internal
##'
NULL

##' Banks: Assets – Loans by Purpose
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-by-purpose}
##' for a full description.
##'
##' @name S31
##'
##' @keywords internal
##'
NULL

##' Banks: Assets – Loans by Product
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-by-product}
##' for a full description.
##'
##' @name S32
##'
##' @keywords internal
##'
NULL

##' Banks: Assets – Loans Fully Secured by Residential Mortgage
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-fully-secured-by-residential-mortgage}
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
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-and-repos-by-industry}
##' for a full description.
##'
##' @name S34
##'
##' @keywords internal
##'
NULL

##' Banks: Assets – Loans by Business Size
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-by-business-size}
##' for a full description.
##'
##' @name S35
##'
##' @keywords internal
##'
NULL

##' Banks: Assets – Loans by Product
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-business-loans-by-product}
##' for a full description.
##'
##' @name S36
##'
##' @keywords internal
##'
NULL

##' Banks: Assets – Agriculture Loans by Product
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-agriculture-loans-by-product}
##' for a full description.
##'
##' @name S37
##'
##' @keywords internal
##'
NULL

##' Banks: Liabilities – Deposits by Sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-liabilities-deposits-by-sector}
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
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-liabilities-deposits-by-industry}
##' for a full description.
##'
##' @name S41
##'
##' @keywords internal
##'
NULL

##' Banks: Assets - Loans by Asset Quality
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/registered-banks/banks-assets-loans-by-asset-quality}
##' for a full description.
##'
##' @name S50
##'
##' @param option Allowed values are \dQuote{default} (default) and \dQuote{longrun}.
##' @keywords internal
##'
NULL

##' NZ's International Reserves and Foreign Currency Liquidity
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/international-position/new-zealands-international-reserves-and-foreign-currency-liquidity} for a full description.
##'
##' @name SDDS
##'
##' @note This is a non-standard dataset.
##'
##' @keywords internal
##'
NULL

##' Non Banks: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/non-banks-balance-sheet} for a full description.
##'
##' @name T1
##'
##' @keywords internal
##'
NULL

##' Non Banks: Funding and Claims by Sector
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/non-banks-funding-and-claims-by-sector} for a full description.
##'
##' @name T4
##'
##' @keywords internal
##'
NULL

##' Savings Institutions: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/savings-institutions-balance-sheet} for a full description.
##'
##' @name T11
##'
##' @keywords internal
##'
NULL

##' Deposit Taking Finance Companies: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/deposit-taking-finance-companies-balance-sheet} for a full description.
##'
##' @name T21
##'
##' @keywords internal
##'
NULL

##' Non-Deposit Taking Finance Companies: Balance Sheet
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/non-deposit-taking-finance-companies-balance-sheet} for a full description.
##'
##' @name T31
##'
##' @keywords internal
##'
NULL

##' Funds Under Management
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/managed-funds-funds-under-management} for a full description.
##'
##' @name T40
##'
##' @keywords internal
##'
NULL

##' Managed Fund Assets
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/managed-funds-assets-by-sector} for a full description.
##'
##' @name T41
##'
##' @keywords internal
##'
NULL

##' Life Insurance
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/life-insurance-assets-by-sector} for a full description.
##'
##' @name T42
##'
##' @keywords internal
##'
NULL

##' KiwiSaver
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/kiwisaver-assets-by-sector} for a full description.
##'
##' @name T43
##'
##' @keywords internal
##'
NULL

##' Other Registered Superannuation
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/other-registered-superannuation-funds-assets-by-sector} for a full description.
##'
##' @name T44
##'
##' @keywords internal
##'
NULL

##' Retail Unit Trusts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/retail-unit-trusts-assets-by-sector} for a full description.
##'
##' @name T45
##'
##' @keywords internal
##'
NULL

##' Cash Management Trusts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/cash-management-trusts-assets-by-sector} for a full description.
##'
##' @name T46
##'
##' @keywords internal
##'
NULL

##' Wholesale Trusts
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/wholesale-trusts-assets-by-sector} for a full description.
##'
##' @name T47
##'
##' @keywords internal
##'
NULL

##' Wholesale Trusts and Other Funds
##'
##' See \url{https://www.rbnz.govt.nz/statistics/series/non-banks-and-other-financial-institutions/wholesale-trusts-and-other-funds-assets-by-product-type} for a full description.
##'
##' @name T48
##'
##' @keywords internal
##'
NULL
