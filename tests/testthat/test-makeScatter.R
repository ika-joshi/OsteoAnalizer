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
  plots_created <- makeScatter(result, "fluid_levels","cartilage_thickness")
  scatter_plot <- makeScatter(result, "fluid_levels","cartilage_thickness")
  expect_true(inherits(scatter_plot, "gg"))
})

# [END]
