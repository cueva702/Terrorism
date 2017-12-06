#loadlibraries
library(shiny)
library(shinydashboard)
library(leaflet)
library(data.table)
library(countrycode)
library(stringr)
library(dplyr)


server <- function(input, output) { 
  
  # read and save the dataset and the map. 
  
  terrorism2 <- fread("terrorism.csv")
  
  
  terrorism2$size <- ifelse(terrorism2$nkill == 1, 1,
                            ifelse(terrorism2$nkill > 1 & terrorism2$nkill <= 10, 2,
                                   ifelse(terrorism2$nkill > 10 & terrorism2$nkill <= 100, 3, 
                                          ifelse(terrorism2$nkill > 100 & terrorism2$nkill <= 500, 4, 5))))
  
  
  terrorism2$popupyear <- paste(sep = ": ", "<b>Year</b>", terrorism2$iyear)
  terrorism2$popupcountry <- paste(sep = ": ", "<b>Country</b>", terrorism2$country_txt)
  terrorism2$popupcity <- paste(sep = ": ", "<b>City</b>", terrorism2$city)
  terrorism2$popupname <- paste(sep = ": ", "<b>Name of organization</b>", terrorism2$gname)
  terrorism2$popuptype <- paste(sep = ": ", "<b>Type of attack</b>", terrorism2$attacktype1_txt)
  terrorism2$popupnkill <- paste(sep = ": ", "<b>Number of people killed</b>", terrorism2$nkill)
  terrorism2$summary <- paste(sep = ": ", "<b>Summary</b>", terrorism2$summary)
  terrorism2$popup <- paste(sep = "<br/>", terrorism2$popupyear, terrorism2$popupcountry, terrorism2$popupcity,
                            terrorism2$popupname, terrorism2$popuptype, terrorism2$popupnkill, terrorism2$summary)
  
  
  
  output$worlmap <- renderLeaflet({
    
    terrorism3 <- terrorism2 %>%
      filter(iyear >= input$year[1] & iyear <= input$year[2])
    
    if(input$typeattack != "All") {
      terrorism3 <- terrorism3[terrorism3$attacktype1_txt == input$typeattack,]}
    
    if(input$numdead == "All"){
      terrorism3 <- terrorism3
    } else if(input$numdead == "1") {
      terrorism3 <- terrorism3[terrorism3$nkill == 1,]
    } else if(input$numdead == "2 and 10") {
      terrorism3 <- terrorism3[terrorism3$nkill > 1 & terrorism3$nkill <= 10,]
    } else if(input$numdead == "11 and 100") {
      terrorism3 <- terrorism3[terrorism3$nkill > 10 & terrorism3$nkill <= 100,]
    }  else if(input$numdead == "101 and 500") {
      terrorism3 <- terrorism3[terrorism3$nkill > 100 & terrorism3$nkill <= 500,]
    } else {
      terrorism3 <- terrorism3[terrorism3$nkill > 500,]
    }  
    
    if (!input$orgname == "") {
      
      terrorism3 <- terrorism3[grep(input$orgname, terrorism3$gname, ignore.case = T),]
      
    }
    
    if (nrow(terrorism3) != 0) {
      
      leaflet(terrorism3) %>% 
        addProviderTiles(providers$Thunderforest.Transport) %>%
        setView(-5.273437, 19, zoom = 2) %>%
        addCircleMarkers(~terrorism3$longitude, ~terrorism3$latitude, 
                         popup = ~terrorism3$popup, 
                         label = ~as.character(terrorism3$iyear), radius = (~terrorism3$size))
    } else {
      
      leaflet() %>% 
        addProviderTiles(providers$Thunderforest.Transport) %>%
        setView(-5.273437, 19, zoom = 2)
      
    }
    
  })      
  
  #ref github
  
}  