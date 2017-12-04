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

year <- read.csv('AttacksperYearinUSA.csv')
View(year)



