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

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Terrorist Attacks in the USA from 1970-2016"),
  

  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(type = "tabs", 
              
                tabPanel('Terrorist Attacks in USA 2000-2016 Map', leafletOutput("mymap")),
                tabPanel('Terrorist Attacks in USA 1983-1999 Map', leafletOutput("usa8090_map")),
                tabPanel('Terrorist Attacks in USA 1970-1982 Map', leafletOutput("usa7080_map")),
                
                
                tabPanel('Summary of Terrorist Attacks in USA 1970-2016'), h2("Summary"),
                p(  h4("Which USA states have the most terrorist attacks?"), "The top 6 states with the most terrorist attacks from 1970-2016 are: California	with 586 attacks, 
                    New York with	504 attacks, Puerto Rico with	247 attacks, Florida with	153 attacks, Illinois with 110 attacks, and Washington State with	98 attacks"),
                p(  h4("Which year has the most terrorist attacks?"), "The year that has the most terrorist attacks in USA is the year 1970 with 468 attacks"),
                p(  h4("What is the most common weapon type used in terrorist attack? ")," The most common weapon type used by terrorists in USA is Explosives/Bombs/Dynamite	with 1392 uses"),
                p(  h4("Which is the most common attack type used by terrorists?"), "The most common attack type used by terrorists in USA is Bombing/Explosion with	1378 uses"),
                p(  h4("Which groups are targeted most by terrorists? "),"The groups targeted the most are:Business	with 769 attacks, Government (General) with	323 attacks,
                    Private Citizens & Property with	318 attacks, Abortion Related with	253 attacks, Military	with 186 attacks, and Educational Institution with	167 attacks"),
                p(  h4("Are terrorist attacks increasing over time?"), "Terrorist attacks in the USA seem to be decreasing with time. In 1970 there were 468 terrorist attacks,
                    in 1980 there were 67 attacks, in 1990 there were 32 attacks, and in 2000 there were 32 attacks. However it appears that the trend might be increasing because
                    in 2016 there were 61 attacks. In 2011 was when the increase in attacks begin in the USA with 10 attacks.")
    )))

#Define Server
server <- function(input, output, session) {


  
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

