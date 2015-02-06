library(shiny)
library(dplyr)
library(ggplot2)
SupCt <- read.csv("SupCt.csv")
shinyServer(function(input, output) {

  output$trendPlot <- renderPlot({

    df_filtered <- SupCt %>% filter(Name==input$name)
    graph_title  <- paste("Ideal Points for ", input$name, sep="")
    ggplot(df_filtered,aes(x=Year, y=Ideal.point))+
      geom_point()+geom_smooth()+theme_bw()+
      labs(x = "Year")+
      labs(y = "Ideal Points")+
      labs(title = graph_title)

  })

})
