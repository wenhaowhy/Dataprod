library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  pageWithSidebar(
    ##Aplication title
    headerPanel("Male BAC Calculator"),
    
    sidebarPanel(
      textInput(inputId = "drinks", label = "Drinks Consumed"),
      textInput(inputId = "weight", label = "Body Weight(lbs)"),
      textInput(inputId = "time", label = "Time Elapsed (in hours)")
      
    ),
    mainPanel(
      h3("BAC Inputs"),
      h4("Alcohol Content Consumed (g)"),
      verbatimTextOutput("alcohol"),
      h4("Your Weight In Grams"),
      verbatimTextOutput("weight1"),
      h4("Time Elapsed"),
      verbatimTextOutput("time1"),
      h3("Calculated BAC"),
      verbatimTextOutput("BAC")
      
    )
  )
  
)