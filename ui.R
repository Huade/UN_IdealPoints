library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Ideal Points"),

  # Sidebar with a slider input for number of bins
  
    sidebarPanel(
      h3("Ideal Points Estimation"),
      # Select Justices name here
      selectizeInput("name",
                  label = "Name(s) of Interest",
                  choices = unique(Ideal_Point_Data$Name),
                  multiple = T,
                  options = list(maxItems = 5,
                                 placeholder = 'Select a name'),
                  selected = "SCJ. Black"
                  ),
      
      # Select whether include medians or not
      checkboxGroupInput("median", 
                         label = "Median ideal point estimates",
                         choices = c("Presidents" = "p",
                                     "Senate" = "s",
                                     "House" = "h",
                                     "Supreme Court" = "sc")
                         ),
      # Term plot
      plotOutput("termPlot", height = 200),
      
      helpText("Data: Bailey & Maltzman, The Constrained Court")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      htmlOutput("trendPlot")
    )
  )
)
