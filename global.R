require(shiny)
suppressPackageStartupMessages(library(googleVis))
require(dplyr)

df <- read.csv("asylum.csv")
Origins <- df %>% group_by(Origin) %>% summarise(Number=sum(Number)) %>% 
        arrange(desc(Number)) %>% select(Origin) %>% as.matrix %>% as.character
Destinations <- df %>% group_by(Destination) %>% summarise(Number=sum(Number)) %>% 
        arrange(desc(Number)) %>% select(Destination) %>% as.matrix %>% as.character