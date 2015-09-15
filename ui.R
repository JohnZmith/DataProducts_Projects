require(shiny)
suppressPackageStartupMessages(library(googleVis))


shinyUI(fluidPage(
        headerPanel("Number of asylum-seekers 2014 by origin and destination"),
        
        fluidRow(
                column(2,  
                        wellPanel(
                              checkboxGroupInput("orig", label = "Include Origins",
                                               choices = Origins, selected = sample(Origins,1))
                       )
                ),
                column(8,
                    #radioButtons(inputId = "country", label = "Show by",
                    #                    choices = c("Origin", "Destination"), selected = "Origin"
                    #                ),
                    #verbatimTextOutput("out"),
                  h3("The shiny app is straightforward to use. Klick on a destination 
                     or origin country to include or exclude it from the Sankey plot. Explore and compare!"),
                    htmlOutput("myChart")
                ),
                column(2,  
                     #  h4("Destination Country"),
                       wellPanel(
                               checkboxGroupInput("dest", "Include Destinations",
                                                 choices = Destinations, selected = sample(Destinations,10))
                       )
                )
                
        )
))



