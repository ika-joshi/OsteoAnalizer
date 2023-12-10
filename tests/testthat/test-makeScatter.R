# context("Testing the functionality of makeScatter")
# library(OsteoAnalizer)

test_that("Error if the input is incorrect", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  result <- CleanCSVFile(testData, "fluid_levels","cartilage_thickness","severity_levels","patient_age")

  # Incorrect Parameter
  expect_error(makeScatter(result, fluid_levels,"cartilage_thickness"))
  expect_error(makeScatter(result, "fluid_levels", cartilage_thickness))
})

test_that("Check if output is a scatter plot", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  result <- CleanCSVFile(testData, "fluid_levels","cartilage_thickness","severity_levels","patient_age")

  # Correct Parameter
  scatter_plot <- makeScatter(result, "fluid_levels","cartilage_thickness")
  expect_true(inherits(scatter_plot, "gg"))
})

test_that("there is no line of regression when reg is FALSE", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  result <- CleanCSVFile(testData, "fluid_levels", "cartilage_thickness", "severity_levels", "patient_age")

  scatter_plot <- makeScatter(result, "fluid_levels", "cartilage_thickness", FALSE)
  geom_smooth_layer <- "GeomSmooth" %in% sapply(scatter_plot$layers, function(layer) class(layer$geom))
  expect_false(geom_smooth_layer)
})

test_that("there is line of regression when reg is TRUE", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  result <- CleanCSVFile(testData, "fluid_levels", "cartilage_thickness", "severity_levels", "patient_age")

  scatter_plot <- makeScatter(result, "fluid_levels", "cartilage_thickness")
  geom_smooth_layer <- "GeomSmooth" %in% sapply(scatter_plot$layers, function(layer) class(layer$geom))
  expect_true(geom_smooth_layer)
})





# [END]
