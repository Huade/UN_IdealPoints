library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Name:", value="Black")),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("trendPlot")
    )
  )
))
