library(googleVis)
library(eurostat)
load("./estat.Rdata")

server <- shinyServer(function(input, output) {
   
   output$dataTable <- renderTable({

      estat[estat$var==input$var & estat$time==input$year,c("cou","var","time","values")]
   })

   output$mymap <- renderGvis({

      gvisGeoChart(estat[estat$var==input$var & estat$time==input$year,], locationvar="cou",
                   colorvar="values",
                   options=list(region="150", projection="kavrayskiy-vii"))

   })
})
