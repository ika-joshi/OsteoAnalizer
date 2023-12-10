#' Launch Shiny App for OsteoAnalizer
#'
#' A function that launches the Shiny app for OsteoAnalizer.
#' The purpose of this app is only to illustrate how a Shiny
#' app works for OsteoAnalizer works. The code has been placed
#' in \code{./inst/shiny-script}.
#'
#' @return No return value but open up a Shiny page.
#'
#' @examples
#' \dontrun{
#'
#' OsteoAnalizer::runOsteoAnalizer()
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#'
#' Silva, A. (2022) TestingPackage: An Example R Package For BCB410H.
#' Unpublished. URL https://github.com/anjalisilva/TestingPackage.
#'
#' @export
#' @importFrom shiny runApp

runOsteoAnalizer <- function() {
  appDir <- system.file("shiny-script",
                        package = "OsteoAnalizer")
  actionShiny <- shiny::runApp(appDir, display.mode = "normal")
  return(actionShiny)
}
# [END]
