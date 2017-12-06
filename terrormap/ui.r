#
# Load libraries
#install.packages("shiny")
#install.packages("shinydashboard")
#install.packages("leaflet")
#install.packages("data.table")
#install.packages("countrycode")
#install.packages("stringr")
#install.packages("dplyr")
library(shiny)
library(shinydashboard)
library(leaflet)
library(data.table)
library(countrycode)
library(stringr)
library(dplyr)



ui <- 
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
#ref github