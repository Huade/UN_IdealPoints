library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Ideal Points for Supreme Court Justices"),

  # Sidebar with a slider input for number of bins
  
    sidebarPanel(
      h3("Ideal Points Estimation"),
      # Select Justices name here
      selectizeInput("name",
                  label = "Justice(s) Name",
                  choices = c("Black","Reed","Frankfurter","Jackson","Burton",
                              "Vinson","Clark","Minton","Douglas","Warren","Harlan","Brennan",
                              "Whittaker","Stewart","White","Goldberg","Fortas","Marshall",
                              "Burger","Blackmun","Powell","Rehnquist","Stevens","OConnor",
                              "Scalia","Kennedy","Souter","Thomas","Ginsburg","Breyer",
                              "Roberts","Alito","Sotomayor","Kagen"),
                  multiple = T,
                  options = list(maxItems = 5,
                                 placeholder = 'Select a justice'),
                  selected = "Black"
                  ),
      
      # Select whether include medians or not
      checkboxGroupInput("median", 
                         label = "Median ideal point estimates",
                         choices = c("Presidents" = "p",
                                     "Senate" = "s",
                                     "House" = "h",
                                     "Supreme Court" = "sc")
                         ),
      
      helpText("Data: Bailey & Maltzman, The Constrained Court")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      htmlOutput("trendPlot")
    )
  )
)
