# context("Testing the functionality of makeBox")
# library(OsteoAnalizer)

test_that("Error if the input is incorrect", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")

  # Incorrect Parameter
  expect_error(makeBox(testData, "fluid_levels","cartilage_thickness","severity_levels","patient_age"))
})

test_that("Check if output is a list", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  result <- CleanCSVFile(testData, "fluid_levels","cartilage_thickness","severity_levels","patient_age")

  # Correct Parameter
  plots_created <- makeBox(result, "fluid_levels","cartilage_thickness","severity_levels","patient_age")

  expect_type(plots_created, "list")
})

test_that("Check if the correct number of plots are created", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  result <- CleanCSVFile(testData, "fluid_levels", "cartilage_thickness", "severity_levels", "patient_age")
  plots_created <- makeBox(result, "fluid_levels", "cartilage_thickness", "severity_levels", "patient_age")
  expect_equal(length(plots_created), 9)
})

test_that("Ensure empty data are handled correctly", {
  empty_data <- data.frame(fluid_levels=numeric(), cartilage_thickness=numeric(),
                           severity_levels=numeric(), patient_age=numeric())
  plots_created <- makeBox(empty_data, "fluid_levels", "cartilage_thickness", "severity_levels", "patient_age")
  expect_type(plots_created, "list")
})






# [END]
