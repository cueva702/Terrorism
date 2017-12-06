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
library(shinydashboard)
library(data.table)
library(countrycode)
library(stringr)
library(dplyr)



# Define UI for application

ui <- fluidPage(
  
  
  
  # Application title
  
  titlePanel("Terrorist Attacks in the USA from 1970-2016"),
  
  
  
  
  
  # Show a plot of the generated distribution
  
  mainPanel(
    
    tabsetPanel(type = "tabs", 
                
                
              
                tabPanel('Summary of Terrorist Attacks in USA 1970-2016', h2("Summary"),
                         
                         p(  h4("Which USA states have the most terrorist attacks?"), "The top 6 states with the most terrorist attacks from 1970-2016 are: California    with 586 attacks, 
                             
                             New York with    504 attacks, Puerto Rico with    247 attacks, Florida with    153 attacks, Illinois with 110 attacks, and Washington State with    98 attacks"),
                         
                         p(  h4("Which year has the most terrorist attacks?"), "The year that has the most terrorist attacks in USA is the year 1970 with 468 attacks"),
                         
                         p(  h4("What is the most common weapon type used in terrorist attack? ")," The most common weapon type used by terrorists in USA is Explosives/Bombs/Dynamite    with 1392 uses"),
                         
                         p(  h4("Which is the most common attack type used by terrorists?"), "The most common attack type used by terrorists in USA is Bombing/Explosion with    1378 uses"),
                         
                         p(  h4("Which groups are targeted most by terrorists? "),"The groups targeted the most are:Business    with 769 attacks, Government (General) with    323 attacks,
                             
                             Private Citizens & Property with    318 attacks, Abortion Related with    253 attacks, Military    with 186 attacks, and Educational Institution with    167 attacks"),
                         
                         p(  h4("Are terrorist attacks increasing over time?"), "Terrorist attacks in the USA seem to be decreasing with time. In 1970 there were 468 terrorist attacks,
                             
                             in 1980 there were 67 attacks, in 1990 there were 32 attacks, and in 2000 there were 32 attacks. However it appears that the trend might be increasing because
                             
                             in 2016 there were 61 attacks. In 2011 was when the increase in attacks begin in the USA with 10 attacks.")),
                
                
                
                tabPanel('Terrorist Attacks in USA 2000-2016 Map', leafletOutput("mymap")),
                
                tabPanel('Terrorist Attacks in USA 1983-1999 Map', leafletOutput("usa8090_map")),
                
                tabPanel('Terrorist Attacks in USA 1970-1982 Map', leafletOutput("usa7080_map")),
                
                tabPanel('World Terrorism', leafletOutput("dashboardPage")),
                
                dashboardPage(skin = "black",
                              dashboardHeader(title = "World terrorism", titleWidth = 480),
                              
                              dashboardSidebar(disable = TRUE),
                              dashboardBody(
                                fluidRow(
                                  column(width = 9,
                                         box(width = NULL, title = "Loading Map", solidHeader = TRUE, status = "warning",
                                             leafletOutput("worlmap", height = 500))),
                                  column(width = 3,
                                         box(width = NULL, status = "warning", tags$h5("Extend years to include time of interest"),
                                             sliderInput("year",
                                                         "Filter by years:",
                                                         min = 1970,
                                                         max = 2015,
                                                         value = c(2015, 2015)),
                                             selectInput("typeattack", label = "Type of attack", 
                                                         choices = c("All", "Bombing/Explosion", 
                                                                     "Armed Assault",
                                                                     "Assassination",
                                                                     "Unknown",
                                                                     "Hostage Taking (Kidnapping)",
                                                                     "Hostage Taking (Barricade Incident)",
                                                                     "Facility/Infrastructure Attack",
                                                                     "Hijacking", "Unarmed Assault"), selected = "All"),
                                             selectInput("numdead", label = "Number of dead people", 
                                                         choices = c("All" = "All", 
                                                                     "1" = "1",
                                                                     "Between 2 and 10"  = "2 and 10",
                                                                     "Between 11 and 100" = "11 and 100",
                                                                     "Between 101 and 500" = "101 and 500",
                                                                     "More than 500" = "more 500"), selected = "All"),
                                             textInput("orgname",
                                                       "Organization which commited Attack", value = "")
                                             
                                             
                                         )
                                  )
                                )
                              )
                )
                
                
                
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
  
}



shinyApp(ui, server)