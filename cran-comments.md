
## Test environments
* Local Kubuntu 18.04.4: R-3.5.2, R-3.6.3, and R-devel.
* win-builder (devel, release, and oldrelease)

## R CMD check results
* No errors or warnings.
* One note - first submission of this package.

## Resubmitted to address CRAN comments:
* Expanded the Description field of the DESCRIPTION file to explain more about
  what the package does.
* Fixed .Rd file titles to meet required format.
* Removed calls to cat() that were not easy to suppress.
* Added examples to the Rd file of exported functions.
* Exported an extra function (allAvailableSeries) to make the examples more
  self-contained.
