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

# [END]
