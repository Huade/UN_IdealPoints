library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)


shinyServer(function(input, output) {
  
  output$trendPlot <- renderUI({
    if (length(input$name)==0) print("Please select at least one country")
    
    else {
      df_trend <- Ideal_Point_Data  %>%
        filter(Name %in% input$name)
      
      # Graph title
      if (length(input$name)>2) {
        j_names_comma <- paste(input$name[-length(input$name)], collapse = ', ')
        j_names <- paste(j_names_comma, ", and ", input$name[length(input$name)],
                         sep="")
      }
      
      else{
        j_names <- paste(input$name, collapse = ' and ')
      }
      
      graph_title  <- paste("Ideal Points for ", j_names, sep="")
      
      ggideal_point <- ggplot(df_trend)+
        geom_line(aes(x=Year, y=Ideal.point, by=Name, color=Name))+
        theme_bw()+
        labs(x = "Year")+
        labs(y = "Ideology")+
        labs(title = graph_title)+
        scale_colour_hue("clarity",l=70, c=150)
      
      # Year range
      min_Year <- min(df_trend$Year)
      max_Year <- max(df_trend$Year)
      
      # Change to an active API key
      py <- plotly(username="Huade", key="zc5zdbq7f9")
      res <- py$ggplotly(ggideal_point, kwargs=list(filename="Ideal Point", 
                                                    fileopt="overwrite",
                                                    auto_open=FALSE))
      tags$iframe(src=res$response$url,
                  frameBorder="0",  # Some aesthetics
                  height=600,
                  width=800)
    }
    
    
  })
  
  output$termPlot <- renderPlot({
    df_term <- Ideal_Point_Data  %>%
      filter(Name %in% input$name) %>% 
      group_by(Name) %>% 
      summarise(terms = n())
    
    trans_theme <- theme(
      panel.grid.minor = element_blank(), 
      panel.grid.major = element_blank(),
      panel.background = element_rect(fill=NA),
      plot.background = element_rect(fill=NA)
    )
    
    ggplot(df_term, aes(x=reorder(Name, terms), y=terms))+
      geom_bar(stat = "identity", fill = "#2980b9")+
      theme_bw()+
      trans_theme+
      labs(y="Terms (in years)", x="")+
      coord_flip()
  }, bg="transparent")
})
