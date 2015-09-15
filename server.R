require(shiny)
suppressPackageStartupMessages(library(googleVis))
require(dplyr)


df <- read.csv("asylum.csv")
Origins <- df %>% group_by(Origin) %>% summarise(Number=sum(Number)) %>% 
        arrange(desc(Number)) %>% select(Origin) %>% as.matrix %>% as.character
Destinations <- df %>% group_by(Destination) %>% summarise(Number=sum(Number)) %>% 
        arrange(desc(Number)) %>% select(Destination) %>% as.matrix %>% as.character


shinyServer(function(input, output, session) {
        
        
        asylum <- reactive({
                        df %>% filter(Destination %in% input$dest & Origin %in% input$orig) %>% 
                                arrange(desc(Number)) %>% filter(Number >= max(Number)/100) 
        })
        
        output$myChart <- renderGvis({ gvisSankey(asylum(), from="Origin", to="Destination", weight="Number",
                                options=list( height=500, width=950,
                                sankey="{ node: { colors: ['#a6cee3', '#b2df8a', '#fb9a99', '#fdbf6f', '#cab2d6', '#ffff99', '#1f78b4', '#33a02c'] },
link: { colorMode: 'gradient', colors: ['#a6cee3', '#b2df8a', '#fb9a99', '#fdbf6f', '#cab2d6', '#ffff99', '#1f78b4', '#33a02c'] }
        }"                
                                  )
                )
        })
        
        output$out <- renderPrint({head(asylum(),20)})
        
})

