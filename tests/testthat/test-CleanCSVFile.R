# context("Checking for CleanCSVFile performance")
# library(OsteoAnalizer)
# tests/testthat/test-CleanCSVFile.R

test_that("CleanCSVFile removes NA values", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")

  # Test CleanCSVFile on the test data
  result <- CleanCSVFile(testData, "fluid_levels","cartilage_thickness","severity_levels","patient_age")

  # Check if the result is a data frame with no NA values
  expect_type(result, "list")
  expect_false(any(is.na(result)))
})


test_that("Error upon invalid user input", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")

  # Input errors
  expect_error(CleanCSVFile(testData, "fluid_levels","Cartilage Thickness",
                            "Severity Levels","Patient Age"))

  expect_error(CleanCSVFile(testData, "Fluid Levels","cartilage_thickness",
                            "Severity Levels","Patient Age"))

  expect_error(CleanCSVFile(testData, "Fluid Levels","Cartilage Thickness",
                            "severity_levels","Patient Age"))

  expect_error(CleanCSVFile(testData, "Fluid Levels","Cartilage Thickness",
                            "Severity Levels","patient_ge"))
})

test_that("No extra data has been added", {
  testData <- system.file("extdata", "example_data.csv", package = "OsteoAnalizer")
  # store initial length of the data set
  org_data <- read.csv(testData)
  # Find the number of rows in uncleaned data set
  org_data <- nrow(org_data)
  # Test CleanCSVFile on the test data
  result <- CleanCSVFile(testData, "fluid_levels","cartilage_thickness","severity_levels","patient_age")
  # Find the number of rows in cleaned data set
  cleaned_data <- nrow(result)
  # Check if any additional data was needed
  expect_true(org_data >= cleaned_data)
})
# [END]
