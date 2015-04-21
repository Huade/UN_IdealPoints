library(shiny)

shinyUI(fluidPage(
  
  # Application title
  # titlePanel(),
  
  # Sidebar with a slider input for number of bins
  
  sidebarPanel(
    h3("Ideal Points Estimation"),
    br(),
    br(),
    # Select Justices name here
    selectizeInput("name",
                   label = "Country Name(s) of Interest",
                   choices = unique(Ideal_Point_Data$Name),
                   multiple = T,
                   options = list(maxItems = 6,
                                  placeholder = 'Select a name'),
                   selected = "UN Average"
                   
    ),
    br(),
    br(),
    br(),
    br(),
    img(src = "logo.gif",height = 50, width = 235)
    
  ),
  
  
  
  mainPanel(
    graphOutput("trendPlot"),
    p("Higher ideal points means more liberal."),
    p("Bailey, Michael, Anton  Strezhnev and Erik Voeten. Forthcoming.'Estimating Dynamic State Preferences from United Nations Voting Data.'",
      "Journal of Conflict Resolution. "),
    p("Visualized by Huade Huo. Code available on", 
      a("GitHub.",href = "https://github.com/Huade/UN_IdealPoints"))
  )
)
)
