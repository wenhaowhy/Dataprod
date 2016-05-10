#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

alc_content <- function(drinks) as.numeric(drinks) *14
weight <- function(bmi) as.numeric(bmi) * 453.592
bac <- function(Drinks, weight, time){
  (((as.numeric(Drinks)*14)/(as.numeric(weight)* 453.592 * 0.68))*100 - (as.numeric(time)*0.015))}



shinyServer(
  function(input, output) {
    output$alcohol <- renderPrint({alc_content(input$drinks)})
    output$weight1 <- renderPrint({weight(input$weight)})
    output$time1 <- renderPrint({input$time})
    output$BAC <- renderPrint({bac(input$drinks, input$weight,
                                   input$time)})
    
    
  }
)