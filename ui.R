library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Ideal Points for Supreme Court Justices"),

  # Sidebar with a slider input for number of bins
  
    sidebarPanel(
      selectizeInput("name",
                  label = "Name",
                  choices = c("Black","Reed","Frankfurter","Jackson","Burton",
                              "Vinson","Clark","Minton","Douglas","Warren","Harlan","Brennan",
                              "Whittaker","Stewart","White","Goldberg","Fortas","Marshall",
                              "Burger","Blackmun","Powell","Rehnquist","Stevens","OConnor",
                              "Scalia","Kennedy","Souter","Thomas","Ginsburg","Breyer",
                              "Roberts","Alito","Sotomayor","Kagen"),
                  multiple = T,
                  options = list(maxItems = 5,
                                 placeholder = 'Select a justice'))
      ),

    # Show a plot of the generated distribution
    mainPanel(
      htmlOutput("trendPlot")
    )
  )
)
