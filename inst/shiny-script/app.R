# References:
# Grolemund, G. (2015). Learn Shiny - Video Tutorials. URL:https://shiny.rstudio.com/tutorial/
# Silva, A. (2022) TestingPackage: An Example R Package For BCB410H. Unpublished. URL https://github.com/anjalisilva/TestingPackage.

library(shiny)
library(shinyalert)


# Define UI
ui <- fluidPage(

  # Page title
  titlePanel("OsteoAnalizer: Analyze data sets related to Osteoarthritis "),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("This is a simple Shiny App that is part of the OsteoAnalizer in R.
               Its purpose is read, separte and clean CSV datasets realted to Osteoarthritis"),
      # br() element to introduce extra vertical spacing ----
      br(),

      tags$b("Description: The goal of OsteoAnalizer is to clean CSV data sets
      containing information related to Osteoarthritis. The package also aims to
      analyse the relation between the 4 key aspects of Osteoarthritis(i.e fluid
      levels, cartilage thickness, severity levels, and patient age) by
             outputing visual elements. "),

      # br() element to introduce extra vertical spacing ----
      br(),
      br(),

      # input
      tags$p("Instructions: Below, enter or select values required to perform the analysis. Default
               values are shown. Then press 'Run'. Navigate the right to explore the results."),

      # br() element to introduce extra vertical spacing ----
      br(),

      # inputs
      shinyalert::useShinyalert(force = TRUE),  # Set up shinyalert

      uiOutput("tab1"),
      actionButton(inputId = "data1",
                   label = "Example Dataset Details"),
      fileInput(inputId = "file1",
                label = "Select a Osteoarthritis dataset to visualize. File should be in .csv format with fluid
      levels, cartilage thickness, severity levels, and patient age columns embeded.",
                accept = c(".csv")),
      textInput(inputId = "fluid_levels",
                label = "Enter the exact representation of the Fluid levels column (eg. fluid_levels, fluidLevels, fl, etc).", "fluid_levels"),
      textInput(inputId = "cartilage_thickness",
                label = "Enter the exact representation of Cartilage Thickness in the dataset (eg. cartilage_thickness, cartilageThickness, etc).", "cartilage_thickness"),
      textInput(inputId = "severity_levels",
                label = "Enter the exact representation of Severity Levels in the dataset (eg. severity_levels, severityLevels, etc).", "severity_levels"),
      textInput(inputId = "patient_age",
                label = "Enter the exact representation of Patient_Age in the dataset (eg. patient_age, age, etc).", "patient_age"),
      selectInput("visMethod", "Choose a visualize method:",
                  choices = c("Scatter", "Bar")),
      uiOutput("scatterPlotInputs"),
      # br() element to introduce extra vertical spacing ----
      br(),

      # actionButton
      actionButton(inputId = "button1",
                   label = "RUN")
    ),

    # Main panel for displaying outputs ----
    mainPanel(
      # Output: Tabset w/ plot, summary, and table ----
      plotOutput('plots')
    )
  )
)


# Define server logic for random distribution app ----
server <- function(input, output) {

  # Get CSV filepath
  dataPath <- eventReactive(eventExpr = input$button1, {
    if (! is.null(input$file1)) {
      input$file1$datapath
    }
  })

  # Get and separate CSV
  dataList <- eventReactive(eventExpr = input$button1, {
    OsteoAnalizer::CleanCSVFile(filepath = dataPath(),
                                fluidLevels = input$fluid_levels,
                                cartThick = input$cartilage_thickness,
                                sevLevels = input$severity_levels,
                                age = input$patient_age)
  })

  # Create a reactive UI element for selecting variables for the scatter plot
  output$scatterPlotInputs <- renderUI({
    if (input$visMethod == "Scatter") {
      tagList(
        selectInput("varOne", "Choose the first variable for scatter plot:",
                    choices = c(fluidLevels = input$fluid_levels,
                                cartilageThickness = input$cartilage_thickness,
                                patientAge = input$patient_age)),
        selectInput("varTwo", "Choose the second variable for scatter plot:",
                    choices = c(cartilageThickness = input$cartilage_thickness,
                                fluidLevels = input$fluid_levels,
                                patientAge = input$patient_age)),
        checkboxInput("regLine", "Include Regression Line?", TRUE)
      )
    }
  })

  # Output plots
  observeEvent(input$button1, {
    if (input$visMethod == "Scatter" && !is.null(dataList())){
      output$plots <- renderPlot({
        OsteoAnalizer::makeScatter(dataMade = dataList(),
                                   varOne = input$varOne,
                                   varTwo = input$varTwo,
                                   reg = input$regLine)
      })
    }
    else if(input$visMethod == "Bar" && !is.null(dataList())) {
      output$plots <- renderPlot({
        OsteoAnalizer::makeBox(dataMade = dataList(),
                               fluidLevels = input$fluid_levels,
                               cartThick = input$cartilage_thickness,
                               sevLevels = input$severity_levels,
                               age = input$patient_age)
      })
    }

  })

  # URLs for downloading data
  url1 <- a("Example Dataset", href="https://github.com/ika-joshi/OsteoAnalizer/blob/main/inst/extdata/example_data.csv")
  output$tab1 <- renderUI({
    tagList("Download:", url1)
  })

  observeEvent(input$data1, {
    # Show a modal when the button is pressed
    shinyalert(title = "Example Dataset",
               text = "This example dataset has 36 entries with columns of
               fluid_levels, cartilage_thickness, severity_levels and patient_age.
               Download and open it to have a better understanding of the dataset.",
               type = "info")
  })

}


# Create Shiny app ----
shiny::shinyApp(ui, server)



# [END]
