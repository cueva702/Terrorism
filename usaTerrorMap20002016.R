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


#All 2000-2016 USA terror data
usaTerrorAll2000Yrs <- leaflet(data = usaTerror20002016) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerrorAll2000Yrs

# The year 2000 USA Terrorist data
usaTerror2000<-leaflet(data = usaTerror20002016[1:32,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2000

# The year 2001 USA Terrorist data
usaTerror2001<- leaflet(data = usaTerror20002016[32:73,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2001

# The year 2002 USA Terrorist data
usaTerror2002<- leaflet(data = usaTerror20002016[74:106,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2002

# The year 2003 USA Terrorist data
usaTerror2003 <- leaflet(data = usaTerror20002016[107:138,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2003

# The year 2004 USA Terrorist data
usaTerror2004 <- leaflet(data = usaTerror20002016[139:147,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2004

# The year 2005 USA Terrorist data
usaTerror2005 <- leaflet(data = usaTerror20002016[148:167,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2005

# The year 2006 USA Terrorist data
usaTerror2006 <- leaflet(data = usaTerror20002016[168:173,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2006

# The year 2007 USA Terrorist data
usaTerror2007 <- leaflet(data = usaTerror20002016[174:182,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2007

# The year 2008 USA Terrorist data
usaTerror2008 <- leaflet(data = usaTerror20002016[183:200,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2008

# The year 2009 USA Terrorist data
usaTerror2009 <- leaflet(data = usaTerror20002016[201:210,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2009

# The year 2010 USA Terrorist data
usaTerror2010 <- leaflet(data = usaTerror20002016[211:227,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2010

# The year 2011 USA Terrorist data
usaTerror2011 <- leaflet(data = usaTerror20002016[228:237,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2011

# The year 2012 USA Terrorist data
usaTerror2012 <- leaflet(data = usaTerror20002016[238:256,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2012

# The year 2013 USA Terrorist data
usaTerror2013 <- leaflet(data = usaTerror20002016[257:276,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2013

# The year 2014 USA Terrorist data
usaTerror2014 <- leaflet(data = usaTerror20002016[277:302,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2014

# The year 2015 USA Terrorist data
usaTerror2015 <- leaflet(data = usaTerror20002016[303:341,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2015

# The year 2016 USA Terrorist data
usaTerror2016 <- leaflet(data = usaTerror20002016[342:402,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
usaTerror2016




