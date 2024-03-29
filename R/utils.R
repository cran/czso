ua_header <- c("User-Agent" = "github.com/petrbouchal/czso")
ua_string <- "github.com/petrbouchal/czso"

is_above_bigsur <- function() {

  sy <- Sys.info()
  si <- utils::sessionInfo()

  if(is.null(si)) return(FALSE)

  if(sy[["sysname"]] == "Darwin") {
    is_above_12 <- grepl("^[2-9][1-9]\\.", sy['release'])

    if (is_above_12) {
      rslt <- TRUE
    }  else {
      rslt <- FALSE
    }
  } else {
    rslt <- FALSE
  }

  return(rslt)

}

get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}

curl_has_securetrans <- function(variables) {
  grepl("Secure\\s?Transpo", curl::curl_version()$ssl_version)
}

curl_runs_securetrans <- function(variables) {
  !grepl("\\(Secure\\s?Transport\\)", curl::curl_version()$ssl_version)
}

ssl_is_old <- function() {
  grepl("SSL/2", curl::curl_version()$ssl_version)
}

stop_on_openssl <- function(variables) {
  if(curl_has_securetrans() & !curl_runs_securetrans() & ssl_is_old()) {
    cli::cli_abort(c("On MacOS Monterey <= 12.2, R cannot reach the CZSO server using default settings.",
                     "You need to get R to use MacOS's {.code curl} utility with the Apple-native SSL backend.",
                     "Please set {.envvar CURL_SSL_BACKEND} by putting {.code CURL_SSL_BACKEND=SecureTransport} in your {.file .Renviron} file and don't forget to add a linebreak after the last line in the file.",
                     "See {.code ?czso::monterey} for details."))
  } else if(!curl_has_securetrans() & !curl_runs_securetrans()) {
    invisible(TRUE)
  } else {
    invisible(TRUE)
  }
}

#' \{czso\} on MacOS Monterey
#'
#' Explanation of how and why extra setup steps are needed to use \{czso\} on MacOS Monterey
#'
#' Some early versions of MacOS Monterey ship with an old version of Libre SSL. This causes an otherwise rare bug where`
#' the certificates on CZSO servers cannot be decrypted, so R cannot communicate with the server. Because R relies on the
#' default system SSL library, this in fact affects even curl on the system command line.
#'
#' The solution in R is to put
#'
#' `CURL_SSL_BACKEND=SecureTransport` into .Renviron. (Don't forget to add a newline if this is the last line in the file).
#' Setting this anywhere after R startup may not work, hence the .Renviron solution is recommended.
#'
#' You can also put this in your system environent e.g. by setting the system variable in the .profile file.
#'
#' The issue no longer exists on MacOS Monterey 12.3 Beta, so presumably will also not exist on Monterey 12.3.
#'
#' @name monterey

NULL
