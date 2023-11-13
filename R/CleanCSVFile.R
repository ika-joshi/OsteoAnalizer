#' Separating CSV Dataset Into four columns
#'
#' The cleaned dataset will formated to contain 4 columns:  fluid levels,
#' cartilage thickness, severity levels, and patient age. In addition, each
#' entry of the data set will contain numeric information(i.e no NA).The return
#' value of this function should be a data frame with rows representing the
#' individuals and columns representing the four variables mentioned above.
#'
#' @param filepath A character string of the filepath to find your dataset.
#' @param fluidLevels A character string of the column representing in the
#'                    fluid level in data set provided.
#' @param cartThick A character string of the column representing in the
#'                  cartilage thickness in data set provided.
#' @param sevLevels A character string of the column representing in the
#'                  severity levels in data set provided.
#' @param age A character string of the column representing in the age of the
#'            individuals in data set provided.
#'
#' @return Returns a list with four columns:
#'    (1) fluid levels
#'    (2) cartilage thickness
#'    (3) severity levels
#'    (4) patient age
#'
#' @examples
#' \dontrun{
#'
#' exampleDataPath <- system.file("extdata",
#'                                "example_data.csv",
#'                                package = "OsteoAnalizer")
#'
#' dataList <- OsteoAnalizer::CleanCSVFile(filepath = exampleDataPath,
#'                                fluidLevels = "Fluid Levels",
#'                                cartThick = "Cartilage Thickness",
#'                                sevLevels = "Severity Levels",
#'                                age = "Age")
#'
#' }
#'
#' @author {Krutika Joshi, \email{krutikadilip.joshi@mail.utoronto.ca}}
#'
#' @references
#' R Core Team (2022). R: A language and environment for statistical
#'   computing. R Foundation for Statistical Computing, Vienna, Austria.
#'   URL https://www.R-project.org/.
#' @importFrom stats na.omit
#' @importFrom utils read.csv
#' @export
#'
CleanCSVFile <- function(filepath,
                        fluidLevels,
                        cartThick,
                        sevLevels,
                        age) {
  # Error checks
  if (is.character(filepath) &
      is.character(fluidLevels) &
      is.character(cartThick) &
      is.character(sevLevels) &
      is.character(age)) {
  } else {
    stop("Make sure all inputs are character string values.")
  }

  # read data into a CSV file
  data <- read.csv(filepath)

  # Error check, check to see if the name provided by the user is present in
  # the CSV file
  required_columns <- c(fluidLevels, cartThick, sevLevels, age)
  if (!all(required_columns %in% colnames(data))) {
    stop("One or more inputted columns not found in the CSV file.")
  }

  # Select the columns with these information
  selected_data <- data[c(fluidLevels, cartThick, sevLevels, age)]

  # Remove NAs
  cleaned_data <- na.omit(selected_data)

  # Return data frame
  return(cleaned_data)
}
