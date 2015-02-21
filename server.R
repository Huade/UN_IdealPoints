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
      
      if (length(input$name)>2) {
        j_names_comma <- paste(input$name[-length(input$name)], collapse = ', ')
        j_names <- paste(j_names_comma, ", and ", input$name[length(input$name)],
                         sep="")
      }
      
      else{
        j_names <- paste(input$name, collapse = ' and ')
      }
      
      graph_title  <- paste("Ideal Points for ", j_names, sep="")
      
      ggideal_point <- ggplot(df_filtered,aes(x=Year, y=Ideal.point, by=Name, color=Name))+
        geom_point()+
        geom_line()+
        theme_bw()+
        labs(x = "Year")+
        labs(y = "Ideal Points")+
        labs(title = graph_title)
      
      # Change to an active API key
      py <- plotly(username="Huade", key="XXXXXXXXX")
      res <- py$ggplotly(ggideal_point, kwargs=list(filename="Ideal Point", 
                                                    fileopt="overwrite",
                                                    auto_open=FALSE))
      tags$iframe(src=res$response$url,
                  frameBorder="0",  # Some aesthetics
                  height=400,
                  width=650)
    }
    
    
  })
  
})
