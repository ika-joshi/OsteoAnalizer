#' Visualizing fluid levels, cartilage thickness or patient age by using a
#' scatter plot
#'
#' This function will take in a data set, two continuous variables and a
#' boolean. And the output will be a scatter plot. The x-axis of the scatter
#' plot will contain one of the parameter variables and the y-axis will
#' contain the latter parameter variable. If the boolean parameter is set to
#' true, the scatterplot will further contain colors based on the severity
#' levels. This function will help understand the relation between the two
#' chosen variables.
#'
#' @param dataMade A character string of the filepath to find your dataset.
#' @param varOne A character string of the first variable that needs
#'               to be examined.
#' @param varTwo A character string of the second variable that needs
#'               to be examined.
#' @param reg A boolean that determines if the scatter plot will contain a line
#'            of regression.
#'
#' @return Returns a scatter plot with the two variables inputted by the user

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
#'
#' OsteoAnalizer::makeScatter(dataList, varOne = "fluid_levels",
#'                                varTwo = "cartilage_thickness")
#'
#'
#' @author {Krutika Joshi, \email{krutikadilip.joshi@mail.utoronto.ca}}
#'
#' @references
#' Chatgpt. ChatGPT. (n.d.). https://openai.com/chatgpt
#'
#' GeeksforGeeks. (2022, December 26). How to color scatter plot points in
#' R ?. GeeksforGeeks.
#' https://www.geeksforgeeks.org/how-to-color-scatter-plot-points-in-r/
#'
#' Li, F. (2022) sexDisaggregate:To Obtain and Analyze Sex-disaggregated Datasets,
#' Unpublished. URL https://github.com/lifangy6/sexDisaggregate"
#'
#' Scatter plot in R programming 🟢 [with examples].
#' R CODER. (2021, June 18). https://r-coder.com/scatter-plot-r/
#'
#' Wickham H (2016). ggplot2: Elegant Graphics for Data Analysis.
# Springer-Verlag New York. ISBN 978-3-319-24277-4,
# <https://ggplot2.tidyverse.org>.
#'
#' @export
#'
#' @importFrom stats coef lm
#' @import ggplot2
#' @import ggpmisc

makeScatter <- function(dataMade, varOne, varTwo, reg = TRUE){
  # Error checks
  if (is.character(varOne) &
      is.character(varTwo) &
      is.logical(reg)) {
  } else {
    stop("Make sure the second and third parameters are character and the
         last is a boolean")
  }

  # Check if varOne and varTwo are within the available choices
  if (!(varOne %in% names(dataMade) && varTwo %in% names(dataMade))){
    stop("Please make sure the variables are one of the following:
         fluid levels, cartilage thickness or patient age")
  }

  # Store x and y axis information
  x_data <- dataMade[, varOne]
  y_data <- dataMade[, varTwo]
  if(reg == TRUE){
    # First compute the line of regression formula
    formula <- lm(y_data ~ x_data, dataMade)
    coefficients <- coef(formula)
    # Store the equation
    equation <- sprintf("y = %.2f + %.2fx", coefficients[1], coefficients[2])

    # Create a scatter plot
    scatter_plot <- ggplot(dataMade, aes(x = x_data, y = y_data)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE, color = "red") +
      geom_text(aes(x = max(x_data), y = max(y_data), label = equation),
                hjust = 1, vjust = 1, color = "black", size = 4) +
      labs(title = paste("Scatter Plot of", varOne, "by", varTwo),
           x = varOne,
           y = varTwo)
  }
  else{
    # Create a scatter plot
    scatter_plot <- ggplot(dataMade, aes(x = x_data, y = y_data)) +
      geom_point() +
      labs(title = paste("Scatter Plot of", varOne, "by", varTwo),
           x = varOne,
           y = varTwo)
  }

  return(scatter_plot)

}
