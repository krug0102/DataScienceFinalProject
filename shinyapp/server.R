#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)

agents<-c("Astra", "Breach", "Brimstone", "Chamber", "Cypher", "Fade", "Gekko",
          "Harbor", "Jett", "KAY/O", "Killjoy", "Neon", "Omen", "Phoenix", "Raze",
          "Reyna", "Sage", "Skye", "Sova", "Viper", "Yoru")

maps<-c("ascent", "fracture", "haven", "icebox", "lotus", "pearl", "split")

ranks<-c("Iron I", "Iron II", "Iron III", "Bronze I", "Bronze II", "Bronze III",
         "Silver I", "Silver II", "Silver III", "Gold I", "Gold II", "Gold III",
         "Platinum I", "Platinum II", "Platinum III", "Diamond I", "Diamond II",
         "Diamond III")

sortFields<-c("KD", "Kills", "Deaths", "Assists", "Matches")

load(file="mapDataList.rdata")


shinyServer(function(input, output) {
    
    # Recommendations Page
    map<-reactive({input$mapInput})
    rank<-reactive({input$rankInput})
    output$text<-renderText(paste0("The 5 best agents on ", map(), " at ", rank(), " are (Based on Win Pct.):"))
    
    table<-reactive({head(mapDataList[[which(maps==tolower(map()))]][[which(ranks==rank())]][,c("Agent", "Agent.Class","Win.Pct.", "Pick.Pct.", "Matches")], 5)})
    
    output$winPctTable<-renderTable(table())
    
    teamComp<-reactive({head(mapDataList[[which(maps==tolower(map()))]][[which(ranks==rank())]][order(mapDataList[[which(maps==tolower(map()))]][[which(ranks==rank())]]$Pick.Pct., decreasing = TRUE),][,c("Agent", "Agent.Class","Win.Pct.", "Pick.Pct.", "Matches")], 5)})
    output$teamCompText<-renderText(paste0("The most common team composition on ", map(), " at ", rank(), " is: "))
    output$teamCompTable<-renderTable(teamComp())
    
    
    # Filtering Page
    filteringMap<-reactive({input$mapFilter})
    filteringRank<-reactive({input$rankFilter})
    kdFilter<-reactive({input$KDFilter})
    killsFilter<-reactive({input$kills})
    matchesFilter<-reactive({input$matches})
    output$filterText<-renderText(paste0("Filtering data for the map ", filteringMap(), " at ", filteringRank()))
    
    output$fullTable<-renderTable(
        mapDataList[[which(maps==tolower(filteringMap()))]][[which(ranks==filteringRank())]][mapDataList[[which(maps==tolower(filteringMap()))]][[which(ranks==filteringRank())]]$KD > kdFilter() & mapDataList[[which(maps==tolower(filteringMap()))]][[which(ranks==filteringRank())]]$Kills > killsFilter() & mapDataList[[which(maps==tolower(filteringMap()))]][[which(ranks==filteringRank())]]$Matches > matchesFilter(),][,c("Agent", "Agent.Class", "Win.Pct.", "KD", "Kills", "Deaths", "Assists", "Matches")])
    
    })
