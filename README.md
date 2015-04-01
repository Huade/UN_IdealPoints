# IdealPoints Data Visualization
This repo is an interactive data visualization project for Prof. Bailey. 

![overview](http://i.imgur.com/lR7NKHt.gif)
# Features
Users can select name(s) of justice of interest when they want to compare ideal points for each justice.

![Select](./figures/select_name.png)

Users can compare up to five justices.

![compare](./figures/plot.png)

Users can zoom-in plot with `ploy.ly` frame.

![zoom_in](./figures/zoom_in.png)
![zoom_in_2](./figures/zoom_in_2.png)

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
