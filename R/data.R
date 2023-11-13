#' Example dataset: Mock data set
#'
#' This dataset, `my_data`, contains information about fluid levels, cartilage
#' thickness, severity levels, and patient age.
#'
#' @format A data frame with 36 rows and 4 columns.
#' @source Provide information about the source of the data, if applicable.
#'
#' @name my_data
#' @docType data
#' @usage data(my_data)
#' @examples
#' data(my_data)

my_data <- data.frame(
  fluid_levels = c(5, 4.8, 5, 4.7, 4.5, 4.6, 4.5, 4.3, 4.2, 5, NA, 3.9, 4, 3.8,
                   3.6, 3.2, 3, 2.9, NA, 3.2, 2.5, 2.9, 2.8, 2.3, 2, 1.9, 1.5,
                   1.3, NA, 1.7, 1.5, 1, 0.9, 0.5, 0.7, 0.3),
  cartilage_thickness = c(3, 2.9, 3, 3, 3.5, 3, 3.5, 3, 3.5, 3.2, 2.9, 2.9, 3,
                          3.5, 3.2, 2.9, 2.9, 3, 2.8, 2.6, 3, NA, 2.3, 2.2, 2,
                          1.8, 1.8, 1.7, 2.9, 3, 2.8, 2.6, 3, 3.2, 2.3, 2.2),
  severity_levels = c(1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3,
                      3, 3, 3, 3, 3, 3, 4, 4, 4, NA, 4, 4, 4, NA, 4, 4, 4),
  patient_age = c(1, 2, NA, 4, 6, 8, 10, 14, 18, 20, 25, 27, 29, 30, 31, 34,
                  36, 38, 43, 46, NA, 48, 49, 50, 52, 55, 60, NA, 68, 69, NA,
                  70, 77, 80, 88, 83)
)

