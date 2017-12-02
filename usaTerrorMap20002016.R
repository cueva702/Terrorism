library(leaflet)
library(ggmap)
library(magrittr)
library(maps)
library(mapproj)
library(ggplot2)
library(plyr)
library(dplyr)
library(htmltools)
library(htmlwidgets)
usaTerror20002016 <- read.csv('USATerrorists20002016.csv')
View(usaTerror20002016)

# Show first 32 rows from the `quakes` dataset
usaTerror2000<-leaflet(data = usaTerror20002016[1:32,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(summary))

# Show first 20 rows from the `quakes` dataset
usaTerror2001<- leaflet(data = usaTerror20002016[32:73,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude)

usaTerrorAll2000Yrs <- leaflet(data = usaTerror20002016) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude)

leaflet(data = quakes[1:20,]) %>% addTiles() %>%
  addMarkers(~long, ~lat, popup = ~as.character(mag), label = ~as.character(mag))