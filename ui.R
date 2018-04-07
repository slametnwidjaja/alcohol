library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(reshape2)
library(shinythemes)
library(DT)
source("chart/chart.R")

fluidPage(theme = shinytheme("slate"),
          navbarPage(
            theme = "slate",  
            "Alcohol",
            tabPanel("About the data",
                     h2("Welcome to my analysis using shinytheme"),
                     h2("Alcohol Consumption"),
                     h3("This folder contains the data behind the story Dear Mona Followup: Where Do People Drink The Most Beer, Wine And Spirits?
Units: Average serving sizes per person Source: World Health Organisation, Global Information System on Alcohol and Health (GISAH), 2010"),
                     tags$p(a(href ="https://fivethirtyeight.com/features/dear-mona-followup-where-do-people-drink-the-most-beer-wine-and-spirits/","Source : https://fivethirtyeight.com/features/dear-mona-followup-where-do-people-drink-the-most-beer-wine-and-spirits/")),
                     tags$p(a(href ="https://github.com/fivethirtyeight/data/tree/master/alcohol-consumption","Source : https://github.com/fivethirtyeight/data/tree/master/alcohol-consumption"))
            ),
            tabPanel("Summary", 
                             h3("Summary"),
                             icon = icon("database"),
                             fluidPage(verbatimTextOutput("viewdata"))
                              #tags$head(tags$style("#viewdata{overflow-x:scroll; max-width: auto}"))
                     ),
            tabPanel("Plotly",
                    icon=icon("signal"),
                    sidebarPanel(
                      width = 3,
                              radioButtons("sumbutton", label = h3("Select Fill"), 
                                           choices = c("region", "subregion"), 
                                           selected = "region")
                              ),
                              mainPanel(
                              plotlyOutput("sum", height = 700)
                              )
                    ),
            tabPanel("Dodge Bar",
                     icon=icon("signal"),
                     sidebarPanel(
                       width = 3,
                       radioButtons("dodgebutton", label = h3("Select Fill"), 
                                    choices = c("regionbar", "subregionbar"), 
                                    selected = "regionbar")
                     ),
                     mainPanel(
                       plotlyOutput("dodgebar", height = 700)
                     )
            ),
            tabPanel("Data Overview",
                     icon=icon("table"),
                     fluidRow(
                       column(4,
                              selectInput("region",
                                          "Region:",
                                          c("All",
                                            unique(as.character(alcohol$region))))
                       ),
                    fluidRow(DT::dataTableOutput("data")),
                    tags$head(tags$style("#data{color : black}"))
                     )
            ),
            tabPanel("About Me",
                     icon=icon("user-circle"),
                     h2("Halloo"),
                     h3("My name : Slamet Natalegam Widjaja"),
                     h3("i'm studying data scientist in algorithm and being capstone stage. This is my capstone. If you have data that will be processed and analyzed please know me, so I can to practice with a lot of data in the process. please contact me in email or in other media. Thank you very much."),
                     h3("Email : slametnwidjaja@gmail.com"),
                     tags$h3(a(href ="https://github.com/slametnwidjaja","Github : https://github.com/slametnwidjaja")),
                     tags$h3(a(href = "https://www.linkedin.com/in/slametnwidjaja/", "My linkedin : https://www.linkedin.com/in/slametnwidjaja/")),
                     tags$h3(a(href = "https://slametnwidjaja.wixsite.com/slametnw","My web : https://slametnwidjaja.wixsite.com/slametnw"))
                              )
            )
      )
