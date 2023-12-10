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
#' @param fluidLevels A character variable that represents the fluid levels in
#'                    the data set
#' @param cartThick A character variable that represents the cartlidge thickness
#'                  in the data set
#' @param sevLevels A character variable that represents the severity level in
#'                  the data set
#' @param age A character variable that represents the age in the data set
#'
#' @return Returns a 3 box plots showcasing the distribution of fluid levels,
#' cartilage thickness and patient age
#'
#' @examples
#'
#' exampleDataPath <- system.file("extdata",
#'                                "example_data.csv",
#'                                package = "OsteoAnalizer")
#'
#' dataList <- OsteoAnalizer::CleanCSVFile(filepath = exampleDataPath,
#'                                fluidLevels = "fluid_levels",
#'                                cartThick = "cartilage_thickness",
#'                                sevLevels = "severity_levels",
#'                                age = "patient_age")
#' OsteoAnalizer::makeBox(dataList, fluidLevels = "fluid_levels",
#'                                cartThick = "cartilage_thickness",
#'                                sevLevels = "severity_levels",
#'                                age = "patient_age")
#'
#' @author {Krutika Joshi, \email{krutikadilip.joshi@mail.utoronto.ca}}
#'
#' @references
#' Chatgpt. ChatGPT. (n.d.). https://openai.com/chatgpt
#'
#' Holtz, Y. (n.d.). Control Ggplot2 Boxplot colors. – the R Graph Gallery.
#' https://r-graph-gallery.com/264-control-ggplot2-boxplot-colors.html
#'
#' Li, F. (2022) sexDisaggregate:To Obtain and Analyze Sex-disaggregated Datasets,
#' Unpublished. URL https://github.com/lifangy6/sexDisaggregate"
#'
#' R box plot. DataMentor. (n.d.). https://www.datamentor.io/r-programming/box-plot
#'
#' Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
# Springer-Verlag New York. ISBN 978-3-319-24277-4,
# <https://ggplot2.tidyverse.org>.
#'
#' @export
#'
#' @import ggplot2
#' @import cowplot
#'

makeBox <- function(dataMade, fluidLevels, cartThick, sevLevels, age) {
  # Input checks
  if (! is.list(dataMade)) {
    stop("Please make sure to use the CleanCSVFile function to clean the data
         before using this function")
  }
  # Error checks
  if (is.character(fluidLevels) &
      is.character(cartThick)&
      is.character(sevLevels)&
      is.character(age)){
  } else {
    stop("Make sure the parameters are character variables")
  }
  if (!(fluidLevels %in% names(dataMade) && cartThick %in% names(dataMade)
        && sevLevels %in% names(dataMade) && age %in% names(dataMade))){
    stop("Please make sure the variable name are matching with the dataset
    provided")
  }

  # Custom color palette
  custom_colors <- c("#66c2a5", "#fc8d62", "#8da0cb", "#e78ac3")

  # First box plot with severity level and fluid levels
  severity_levels <- dataMade[, sevLevels]
  fluid_levels <-  dataMade[, fluidLevels]
  cartilage_thickness <- dataMade[, cartThick]
  patient_age <- dataMade[, age]

  box_sev <- ggplot(dataMade, aes(x = as.factor(severity_levels), y = fluid_levels, fill = as.factor(severity_levels))) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    labs(title = "Box Plot of Fluid Levels by Severity Levels",
         x = "Severity Levels",
         y = "Fluid Levels") +
    scale_fill_manual(values = custom_colors) +
    guides(fill = "none")

  # Second box plot with severity level and Cartilage Thickness
  box_thick <- ggplot(dataMade, aes(x = as.factor(severity_levels), y = cartilage_thickness, fill = as.factor(severity_levels))) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    labs(title = "Box Plot of Cartilage Thickness by Severity Levels",
         x = "Severity Levels",
         y = "Cartilage Thickness") +
    scale_fill_manual(values = custom_colors) +
    guides(fill = "none")

  # Third box plot with severity level and Cartilage Thickness
  box_age <- ggplot(dataMade, aes(x = as.factor(severity_levels), y = patient_age, fill = as.factor(severity_levels))) +
    geom_boxplot(alpha = 0.7, outlier.shape = NA) +
    labs(title = "Box Plot of Age by Severity Levels",
         x = "Severity Levels",
         y = "Age") +
    scale_fill_manual(values = custom_colors) +
    guides(fill = "none")

  # Combine plots
  final_plots <- cowplot::plot_grid(box_sev, box_thick, box_age, labels = c("A", "B", "C"))
  return(final_plots)
}

# [END]
