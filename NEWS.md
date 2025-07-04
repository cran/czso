# czso 0.5.0

* fix issue in `czso_get_table_schema()` detecting JSON format in schema URL
* make less use of the stringi dependency

# czso 0.4.1

* add new function `czso_filter_catalogue()` which provides an ergonomic search of the catalogue, searching relevant fields of the catalogue for a union of the search terms.
* related to above, `czso_get_catalogue()` has a new `search_terms` parameter, which filters the catalogue inline.

# czso 0.4.0

* move to new CZSO API
* remove deprecated functions (all exported functions not starting with `czso_`)

# czso 0.3.12

* fix link with 302 code for CRAN checks

# czso 0.3.11

* fix documentation to avoid CRAN NOTEs
* handle invalid JSON in old CZSO API
* hard-deprecate old functions; they will be removed in the next version

# czso 0.3.10

* update Roxygen2 version and rebuild documentation to handle CRAN validation of HTML manual

# czso 0.3.9

* removed usethis dependency; messages now done by {cli}
* removed stringr dependency
* readded stringi dependency

# czso 0.3.8

* On MacOS Monterey, native `curl` cannot reach https://www.czso.cz/, making it impossible for R to reach it. So on Monterey machines with the default `curl` configuration, all functions accessing the server will fail with a message instructing the user to set an option in .Renviron to resolve this issue. This is a temporary situation until the bug is fixed in MacOS or a fix is found in R that does not require the user to set environment variables.

# czso 0.3.7

* remove the unnecessary {stringi} dependency

# czso 0.3.6

* update tests to fix CRAN failure due to unreachable provider server
* fixed minor bug in how multi-file archives are handled

# czso 0.3.5

NOTE: there has been an unexpected change to the National Open Data Catalogue which caused problems with the dataset IDs returned by `czso_get_catalogue()`. This release provides a temporary fix based on a patch to the API kindly provided by the Czech Statistical Office. 

Future releases will handle the change in a more robust way once the final form of the catalogue API is determined by the CZSO.

## Fixes to code that is currently not used but may be again as the dust settles:

* fix SPARQL query to return all datasets, incl. 2 that were not showing up compared to the official data catalogue web interface
* return label, rather than IRI, for temporal resolution, in the output of `czso_get_catalogue()`

# czso 0.3.4

* minor fixes for CRAN checks

# czso 0.3.3

* update SPARQL query to reflect new version of provider's data catalogue
* fix bug in `czso_get_table()` (@jlacko)
* add link in README to [Awesome Official statistics](https://github.com/SNStatComp/awesome-official-statistics-software) list

# czso 0.3.2

* minor README edit for CRAN resubmission 

# czso 0.3.1

* minor README edits for CRAN resubmission 

# czso 0.3.0

## New features

* codelists (číselníky) can now be retrieved with `czso_get_codelist()`. This includes hierarchies between codelist items, and English versions where available

## Improvements

* new `dest_dir` parameter in `czso_get_[table|codelist]()` allows you to store downloaded data files in a custom location. This location can be set at script or user (.Rprofile) level by setting the `czso.dest_dir` option.
* improved UI: more informative and better formatted messages, hints and reminders about common mishaps
* documentation added in `czso_get_table()` on where to get definitions of indicators and variables used by CZSO.
* more date-type columns are parsed and typed correctly

## Bug fixes

* deprecated functions no longer used internally
* encoding guess no longer breaks on Linux (@jlacko)

## Deprecations of functions with old names

* functions named `get_czso_*` are now deprecated and will emit a warning if used. Use `czso_*()` instead.

# czso 0.2.3

## Fixes responding to CRAN feedback

* Description field of DESCRIPTION now contains a link to the data provider
* documentation in all functions now provide more detail on what the functions return

## Other changes

* `czso_get_table_schema()` now throws error for non-JSON schema and includes URL in error message
* `czso_get_table()` now writes files it cannot read with the right extension
* `czso_get_dataset_doc()` returns URL only invisibly if `action` is `"open"`

# czso 0.2.2

## Prep for CRAN

* add cran-comments.md
* fixed dplyr-related CHECK NOTE
* updated LICENSE for CRAN
* update URL in README

## Bug fixes and minor improvements

* all functions accessing CZSO data now return helpful error if the dataset cannot be found
* fixed deprecation warnings to display correct package name
* added helpful error message for no access to the internet
* spelling corrections
* better error output when CZSO server returns error

# czso 0.2.1

## New function names and deprecations

* all user-facing functions are now `czso_*` to avoid conflicts and aid discovery via auto-complete. Original functions are soft-deprecated.

## Improvements

* improvements to documentation
* added code of conduct and contributing guide

# czso 0.2.0

## New features

* new `get_dataset_doc()` function for accessing documentation
* new `get_table_schema()` function for retrieving table schema
* exported `get_dataset_metadata()` function for accessing detailed metadata

# czso 0.1.5

## Improvements

* get_czso_catalogue() is now much faster as it uses the open data catalogue's API instead of downloading a huge CSV list of all datasets. It is less flexible as it does not allow direct filtering.
* handle encoding of some older datasets, which may not be UTF-8

# czso 0.1.4

* relaxed stringi version requirement to make Win build work

# czso 0.1.3

## Deprecated functions

* both exported functions are renamed to `get_czso_catalogue()` and `get_czso_table()` to avoid clashes with other packages; original functions are soft-deprecated and will be removed in future versions.

## Bug fixes

* fix bug in `get_czso_catalogue()` where an empty tibble was returned because the source CSV was read incorrectly (due to `vroom` handling of newlines inside fields)

# czso 0.1.2

* add per-session caching to `get_catalogue()` and `get_table()`, incl. new `force_redownload` parameter

# czso 0.1.1

* fixed error when loading zipped files in `get_table()`

# czso 0.1.0

* first version with functioning core workflow

# czso 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
