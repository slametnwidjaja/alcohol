library(dplyr)
library(ggplot2)
library(reshape2)
library(plotly)
library(shinythemes)
library(DT)
source("chart/chart.R")


shinyServer(function(input, output) {
  
  output$data <- DT::renderDataTable({
    DT::datatable({
      table <- alcohol
      if (input$region != "All") {
        table <- table[table$region == input$region,]
      }
      table
    })
  })

  
  output$viewdata <- renderPrint({
   viewdata
    })  

  output$sum <- renderPlotly({
   if(input$sumbutton == "region"){
      regionsum
   }else if(input$sumbutton == "subregion"){
     subregionsum
   }
    })
  
  output$dodgebar <- renderPlotly({
    if(input$dodgebutton == "regionbar"){
      meltsumregion
    }else if(input$dodgebutton == "subregionbar"){
      meltsumsubregion
    }
     })
})