
# RBNZ 3.0.0

* Added support for new series B7, B30, C33, C70, C71, H1 (previously M13), H2,
  H3, M15, S35, S36, S37, S45, S46, S50, S51
* Updated the download logic to use the data index page.
* Added an argument to getSeries to allow for only the latest spreadsheet to be
  downloaded with any historical ones being re-used from previous sessions. Also
  added one to allow for fully offline operation, assuming the necessary files
  have already been downloaded.
* Added extra parsing for those series with non-standard formats, mostly handling
  column headers and dates.
* Added the ability to store a destination directory in .Rprofile.
* Dropped support of getReleaseCalendar, removing RSelenium and wdman from Suggests.
* Changed the various date columns to be of type Date instead of type POSIXct.
* Removed the daily and monthly options from B2.
* A bunch of linting and styling improvements.

# RBNZ 2.0.0

* Updated documentation to describe how users now need their public IP address
  whitelisted by the RBNZ.
* Added a default 60 second wait time between downloads to comply with new terms
  of service on the RBNZ website.
* Added the ability to retrieve the RBNZ release calendar. This requires RSelenium
  so this is added under the Suggests field.
* Added the ability to load saved copies of the series page and spreadsheets so that
  the package can be used without the internet.
* Changed how the SDDS series is handled to reflect changes to the website.

# RBNZ 1.1.0

* Added support for the new series C65 and C66.

# RBNZ 1.0.1

* Fixes to address CRAN comments.

# RBNZ 1.0.0

* First release.
