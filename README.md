# IdealPoints Data Visualization
This repo is an interactive data visualization project for Prof. Bailey. 

![overview](http://i.imgur.com/lR7NKHt.gif)

# How to use
1. Download the repo as a zip file (or clone it)
2. Set the `IdealPoints` folder as the working directory in R.
3. Change the API key in `server.R` to an active one (see email or register with [plot.ly](https://plot.ly/)).
4. Install the `plotly` package from GitHub

    ```r
    # Install and load the devtools package. 
    install.packages("devtools")
    library("devtools")

    # install plotly
    install_github("ropensci/plotly")
    ```

5. Call `shiny` inside R
    ```r
    shiny::runApp()
    ```
