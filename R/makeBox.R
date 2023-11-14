#' Visualizing severity level against the fluid levels, cartilage thickness
#' or patient age.
#'
#' The function will take in a data set and a continuous variable
#' (i.e fluid levels, cartilage thickness or patient age). Then the data set
#' will be grouped based on the severity levels and 5 box plots will be created
#' to examine the distribution of the parameter variable across the severity
#' levels. The purpose of this function is to examine the distribution of the
#' variable across the severity levels.
#'
#' @param dataMade A list created by separateCSV.
#'
#' @return Returns a 3 box plots showcasing the distribution of fluid levels,
#' cartilage thickness and patient age
#'
#' @examples
#' \dontrun{
#'
#' exampleDataPath <- system.file("extdata",
#'                                "example_data.csv",
#'                                package = "OsteoAnalizer")
#'
#' dataMade <- OsteoAnalizer::CleanCSVFile(filepath = exampleDataPath,
#'                                fluidLevels = "fluid_levels",
#'                                cartThick = "cartilage_thickness",
#'                                sevLevels = "severity_levels",
#'                                age = "age")
#' OsteoAnalizer::makeBox(dataMade)
#' }
#'
#' @author {Krutika Joshi, \email{krutikadilip.joshi@mail.utoronto.ca}}
#'
#' @references
#' R Core Team (2022). R: A language and environment for statistical
#'   computing. R Foundation for Statistical Computing, Vienna, Austria.
#'   URL https://www.R-project.org/.
#'
#' @export
#'
#' @import ggplot2
#' @import cowplot
#'

makeBox <- function(dataMade) {
  # Input checks
  if (! is.list(dataMade)) {
    stop("Please make sure to use the CleanCSVFile function to clean the data
         before using this function")
  }

  # Custom color palette
  custom_colors <- c("#66c2a5", "#fc8d62", "#8da0cb", "#e78ac3")

  # First box plot with severity level and fluid levels
  box_sev <- ggplot(dataMade, aes(x = as.factor(severity_levels), y = fluid_levels, fill = as.factor(severity_levels))) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    labs(title = "Box Plot of Fluid Levels by Severity Levels",
         x = "Severity Levels",
         y = "Fluid Levels") +
    scale_fill_manual(values = custom_colors)

  # Second box plot with severity level and Cartilage Thickness
  box_thick <- ggplot(dataMade, aes(x = as.factor(severity_levels), y = cartilage_thickness, fill = as.factor(severity_levels))) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    labs(title = "Box Plot of Cartilage Thickness by Severity Levels",
         x = "Severity Levels",
         y = "Cartilage Thickness") +
    scale_fill_manual(values = custom_colors)

  # Third box plot with severity level and Cartilage Thickness
  box_age <- ggplot(dataMade, aes(x = as.factor(severity_levels), y = patient_age, fill = as.factor(severity_levels))) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    labs(title = "Box Plot of Age by Severity Levels",
         x = "Severity Levels",
         y = "Age") +
    scale_fill_manual(values = custom_colors)

  # Combine plots
  final_plots <- cowplot::plot_grid(box_sev, box_thick, box_age, labels = c("A", "B", "C"))
  return(final_plots)
}

# [END]
