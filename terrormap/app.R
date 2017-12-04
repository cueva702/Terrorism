#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(leaflet)
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Terrorist Attacks in the USA from 1970-2016"),
  
  
  
  
  
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(type = "tabs", 
                tabPanel('The Number of Terrorist Attacks in USA  by Year', tableOutput("table")),
                tabPanel('Terrorist Attacks in USA 2000-2016 Map', leafletOutput("mymap")),
                tabPanel('Terrorist Attacks in USA 1983-1999 Map', leafletOutput("usa8090_map")),
                tabPanel('Terrorist Attacks in USA 1970-1982 Map', leafletOutput("usa7080_map"))
    )))


server <- function(input, output, session) {

  output$table <- renderTable({
   AttacksperYearinUSA
    
   })
  
  output$mymap <- renderLeaflet({
    leaflet(data = usaTerror20002016) %>% addTiles() %>%
      addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
    
  })
  
  output$usa8090_map <- renderLeaflet({
    leaflet(data = usaTerror19991983) %>% addTiles() %>%
      addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
  })
  
  output$usa7080_map <- renderLeaflet({
    leaflet(data = usaTerror19701982) %>% addTiles() %>%
      addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
  }) 
  
}

shinyApp(ui, server)

