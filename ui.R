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
                   options = list(maxItems = 5,
                                  placeholder = 'Select a name'),
                   selected = "United States of America"
                   
    ),
    br(),
    br(),
    br(),
    br(),
    br(),
    img(src = "http://visualidentity.georgetown.edu/sites/visualidentity/files/files/upload/logo-banner.jpg")
    
  ),
    
    
  
  mainPanel(
    graphOutput("trendPlot"),
    p("Bailey, Michael, Anton  Strezhnev and Erik Voeten. Forthcoming.'Estimating Dynamic State Preferences from United Nations Voting Data.' Journal of Conflict Resolution. Visualized by Huade Huo. Code available on", a("GitHub.", 
          href = "https://github.com/Huade/UN_IdealPoints"))
  )
)
)
