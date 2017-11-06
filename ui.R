

library(shiny)

ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("R&D intensity by sector in EU countries"),
   
   sidebarLayout(
      sidebarPanel(
         selectInput(inputId="var", label="Select variable", choices=unique(estat$var)),
         selectInput(inputId="year", label="Select year", choices=unique(estat$time))
      ),
      
      # Show a plot according to the selected variables and year
      mainPanel(
         tabsetPanel(
            tabPanel("map",htmlOutput("mymap")),
            tabPanel("data", tableOutput("dataTable"))
         )
      )
   )
))




