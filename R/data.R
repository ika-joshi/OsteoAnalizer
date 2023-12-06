#' Example dataset: Mock data set with Osteoarthritis Patient Information
#'
#' This dataset, `OA_data`, contains information about patients with Osteoarthritis.
#' The variables present in this data set are the fluid_levels,
#' cartilage_thickness, severity_levels and the patient_age. The fluid_levels represent
#' the synovial fluid found in knee joints. This is measured in milliliters. The
#' cartilage_thickness variable as described by the name is the thickness of the
#' cartilage found in the knee and is measured in millimeters.
#' The severity_levels goes from a scale from 0 (least severe) to 4
#' (most severe). This variable represents the progression of osteoarthritis
#' in that individual. And lastly, the patient_age variable depicts the age of
#' the individual. This mock dataset is created to showcase the use of
#' osteoarthritis data in conjunction to the analysis functions
#' present in this project. The data was developed with reference to the data
#' set collected from U.S. Department of Health and Human Services.
#'
#' @format A data frame with 36 rows and 4 columns.
#' @source U.S. Department of Health and Human Services
#'
#' @name OA_data
#' @docType data
#' @usage data(OA_data)
#' @examples
#' data(OA_data)

OA_data <- data.frame(
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




