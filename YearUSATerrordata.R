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

usaTerror19991983 <- read.csv('19831999USATerrorAttacks.csv')
View(usaTerror19991983)

usaTerror19701982 <- read.csv('19701982USATerrorAttacks.csv')
View(usaTerror19701982)

# The year 2000 USA Terrorist data
usaTerror2000<-filter( usaTerror20002016[1:32,])
View(usaTerror2000)  

# The year 2001 USA Terrorist data
usaTerror2001<- filter(usaTerror20002016[32:73,]) 
View(usaTerror2001)

# The year 2002 USA Terrorist data
usaTerror2002<- filter(usaTerror20002016[74:106,]) 
View(usaTerror2002)

# The year 2003 USA Terrorist data
usaTerror2003 <- filter(usaTerror20002016[107:138,])
View(usaTerror2003)

# The year 2004 USA Terrorist data
usaTerror2004 <- filter(usaTerror20002016[139:147,])
View(usaTerror2004)

# The year 2005 USA Terrorist data
usaTerror2005 <- filter(usaTerror20002016[148:167,])
View(usaTerror2005)

# The year 2006 USA Terrorist data
usaTerror2006 <- filter(usaTerror20002016[168:173,]) 
View(usaTerror2006)

# The year 2007 USA Terrorist data
usaTerror2007 <- leaflet(data = usaTerror20002016[174:182,]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(summary), label = ~as.character(city))
View(usaTerror2007)

# The year 2008 USA Terrorist data
usaTerror2008 <- filter(usaTerror20002016[183:200,]) 
View(usaTerror2008)

# The year 2009 USA Terrorist data
usaTerror2009 <- filter(usaTerror20002016[201:210,])
View(usaTerror2009)

# The year 2010 USA Terrorist data
usaTerror2010 <- filter(usaTerror20002016[211:227,])
View(usaTerror2010)

# The year 2011 USA Terrorist data
usaTerror2011 <- filter(usaTerror20002016[228:237,]) 
View(usaTerror2011)

# The year 2012 USA Terrorist data
usaTerror2012 <- filter(usaTerror20002016[238:256,])
View(usaTerror2012)

# The year 2013 USA Terrorist data
usaTerror2013 <- filter(usaTerror20002016[257:276,]) 
View(usaTerror2013)

# The year 2014 USA Terrorist data
usaTerror2014 <- filter(usaTerror20002016[277:302,]) 
View(usaTerror2014)

# The year 2015 USA Terrorist data
usaTerror2015 <- filter(usaTerror20002016[303:341,]) 
View(usaTerror2015)

# The year 2016 USA Terrorist data
usaTerror2016 <- filter(usaTerror20002016[342:402,]) 
View(usaTerror2016)
