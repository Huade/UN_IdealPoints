library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  
    sidebarPanel(
      selectInput("name",
                  label = "Name",
                  choices = c("Black","Reed","Frankfurter","Jackson","Burton",
                              "Vinson","Clark","Minton","Douglas","Warren","Harlan","Brennan",
                              "Whittaker","Stewart","White","Goldberg","Fortas","Marshall",
                              "Burger","Blackmun","Powell","Rehnquist","Stevens","OConnor",
                              "Scalia","Kennedy","Souter","Thomas","Ginsburg","Breyer",
                              "Roberts","Alito","Sotomayor","Kagen"))
      ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("trendPlot")
    )
  )
)
