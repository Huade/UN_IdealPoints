library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

SupCt <- read.csv("SupCt.csv")
shinyServer(function(input, output) {
  
  output$trendPlot <- renderUI({
    if (length(input$name)==0) print("Please select at least one justice")
    
    else {
      df_filtered <- SupCt %>% 
        filter(!is.na(Ideal.point)) %>%
        filter(Name %in% input$name)
      
      j_names <- paste(input$name, collapse = ' and ')
      graph_title  <- paste("Ideal Points for", j_names, sep="")
      
      
      ggideal_point <- ggplot(df_filtered,aes(x=Year, y=Ideal.point, by=Name, color=Name))+
        geom_point()+
        geom_line()+
        theme_bw()+
        labs(x = "Year")+
        labs(y = "Ideal Points")+
        labs(title = graph_title)
      
      p <- plotly(username="Huade", key="t23brq57cr")
      res <- py$ggplotly(ggideal_point, kwargs=list(filename="Ideal Point", 
                                                    fileopt="overwrite", # Overwrite plot in Plotly's website
                                                    auto_open=FALSE))
      tags$iframe(src=res$response$url,
                  frameBorder="0",  # Some aesthetics
                  height=400,
                  width=650)
    }
    
    
  })
  
})
