library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(ggthemes)


shinyServer(function(input, output, session) {

  output$trendPlot <- renderGraph({
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
        labs(x = "Year")+
        labs(y = "Ideology")+
        labs(title = graph_title)+
        scale_colour_hue("clarity",l=70, c=150)+
        theme_few()
      
      ggideal_point <- ggideal_point+
        theme(legend.direction = "horizontal", legend.position = "bottom")


      
      # Year range
      min_Year <- min(df_trend$Year)
      max_Year <- max(df_trend$Year)
      

      fig <- gg2list(ggideal_point) # This converts the ggplot2 graph into Plotly's format, where you can see all of the keys

      data <- list()
      for(i in 1:(length(fig)-1)){data[[i]]<-fig[[i]]}
      layout <- fig$kwargs$layout
      return(list(
          list(
              id="trendPlot",
              task="newPlot",
              data=data,
              layout=layout
          )
      ))
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
