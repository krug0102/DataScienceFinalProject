#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(data.table)

sortFields<-c("KD", "Kills", "Deaths", "Assists", "Matches")

shinyUI(fluidPage(
    theme = shinytheme("flatly"),
    tabsetPanel(
        tabPanel("Home",
                 titlePanel("Valorant Agent Recommendations"),
                 mainPanel(
                     div(
                         img(src="12-Valorant-agents.png", width=900, align="center"),
                         style="text-align: center;"),
                     br(),
                     div(
                         p("Welcome to my Data Science Final Project! This project hopes to give recommendations 
                           about what Valorant agent(s) to play given a competitive rank (from Iron I to Diamond III) 
                           and a map."),
                         style="text-align: center;") # end div
                     )),
        tabPanel("Recommendations",
                 titlePanel("Recommendations for you"),
                 div(
                     h3("Input your rank and a map to get the best agents!")
                 ),
                 br(),
                 br(),
                 sidebarLayout(
                     sidebarPanel(
                         helpText("Select a map and rank:"),
                         inputPanel(
                             div(selectInput(inputId = "mapInput", label = "Choose a map:", choices = list("Ascent"="Ascent",
                                                                                                              "Fracture"="Fracture",
                                                                                                              "Haven"="Haven",
                                                                                                              "Icebox"="Icebox",
                                                                                                              "Lotus"="Lotus",
                                                                                                              "Pearl"="Pearl",
                                                                                                              "Split"="Split")),
                                    selectInput(inputId = "rankInput", label = "Choose a rank:", choices = list("Iron I" = "Iron I",
                                                                                                                "Iron II" = "Iron II",
                                                                                                                "Iron III" = "Iron III",
                                                                                                                "Bronze I" = "Bronze I",
                                                                                                                "Bronze II" = "Bronze II",
                                                                                                                "Bronze III" = "Bronze III",
                                                                                                                "Silver I" = "Silver I",
                                                                                                                "Silver II" = "Silver II",
                                                                                                                "Silver III" = "Silver III",
                                                                                                                "Gold I" = "Gold I",
                                                                                                                "Gold II" = "Gold II",
                                                                                                                "Gold III" = "Gold III",
                                                                                                                "Platinum I" = "Platinum I",
                                                                                                                "Platinum II" = "Platinum II",
                                                                                                                "Platinum III" = "Platinum III",
                                                                                                                "Diamond I" = "Diamond I",
                                                                                                                "Diamond II" = "Diamond II",
                                                                                                                "Diamond III" = "Diamond III")))
                         )),
                     mainPanel(
                         div(
                         textOutput("text"),
                         tableOutput("winPctTable"),
                         textOutput("teamCompText"),
                         tableOutput("teamCompTable"))
                     ) # end mainPanel
                 )),
                 tabPanel("Filtering",
                          titlePanel("Filtering the Data"),
                          div(
                              h3("Here you can filter the data based on the fields!")
                          ),
                          br(),
                          br(),
                          sidebarLayout(
                              sidebarPanel(
                                  help("Filter the data"),
                                  inputPanel(
                                      div(
                                          selectInput(inputId = "mapFilter", label = "Choose a map:", choices = list("Ascent"="Ascent",
                                                                                                                    "Fracture"="Fracture",
                                                                                                                    "Haven"="Haven",
                                                                                                                    "Icebox"="Icebox",
                                                                                                                    "Lotus"="Lotus",
                                                                                                                    "Pearl"="Pearl",
                                                                                                                    "Split"="Split")),
                                          selectInput(inputId = "rankFilter", label = "Choose a rank:", choices = list("Iron I" = "Iron I",
                                                                                                                      "Iron II" = "Iron II",
                                                                                                                      "Iron III" = "Iron III",
                                                                                                                      "Bronze I" = "Bronze I",
                                                                                                                      "Bronze II" = "Bronze II",
                                                                                                                      "Bronze III" = "Bronze III",
                                                                                                                      "Silver I" = "Silver I",
                                                                                                                      "Silver II" = "Silver II",
                                                                                                                      "Silver III" = "Silver III",
                                                                                                                      "Gold I" = "Gold I",
                                                                                                                      "Gold II" = "Gold II",
                                                                                                                      "Gold III" = "Gold III",
                                                                                                                      "Platinum I" = "Platinum I",
                                                                                                                      "Platinum II" = "Platinum II",
                                                                                                                      "Platinum III" = "Platinum III",
                                                                                                                      "Diamond I" = "Diamond I",
                                                                                                                      "Diamond II" = "Diamond II",
                                                                                                                      "Diamond III" = "Diamond III")),
                                          sliderInput(inputId = "KDFilter", label = "Filter the agents by average K/D", min = 0.0, max = 1.5, step = .05, value = 0),
                                          sliderInput(inputId = "kills", label = "Filter the agents by average Kills", min = 0.0, max = 30.0, step = .5, value = 0),
                                          sliderInput(inputId = "matches", label = "Filter the agents by number of matches played", min = 0, max = 45000, step = 500, value = 0)
                                      ) # end div
                                  ) # end inputPanel
                              ), # end sidebarPanel
                              mainPanel(
                                  div(
                                      textOutput("filterText"),
                                      br(),
                                      br(),
                                      tableOutput("fullTable")
                                      
                                  ) # end div
                              ) # end mainPanel
                          ), # end sidebarLayout
                          ) # end tabPanel
    ) # end tabsetPanel
    ))


