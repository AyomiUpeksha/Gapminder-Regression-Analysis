#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(gapminder)

shinyUI(fluidPage(
    titlePanel("Gapminder Data Analysis"),
    sidebarLayout(
        sidebarPanel(
            h3("Step 01:"),
            selectInput("plotnumber", "Select Continent",c("Africa","Americas",
                                                     "Asia","Europe","Oceania",selected ="Africa")),
            h3("step 02:"),
            
            h4("Slope"),
            textOutput("slopeOut"),
            
            h4("Intercept"),
            textOutput("intOut"),
            
            checkboxInput("showX","show/hide X axis",value = TRUE),
            checkboxInput("showY","show/hide Y axis",value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        #This is the first tab panel describe the user guide og the application
                        tabPanel("Description",br(),h1(strong("Title"), style = "font-size:20px;"),br(),
                                 h5("This analysis based on the gapmider dataset given in the R package. 
                                 The data set consists of the information about year ranges from 1952 to 2007, 142 countries, 
                                 life expectancy at birth in years, Five continents, population and GDP per capita.")
                                 ,br(),h5("In step o1, first you have to select the continent and submit it. After that process you 
                                          can be seen the relationship between GDP per capita and the life expectancy. Furthermore, 
                                          it can be seen how the life expectancy varies with GDP with the population when time increasing. 
                                          When you selecting some specific node from the figure you can be identified the country.") ,
                                 h5("In step 02, You have select the area and submit it, then you can be seen the regressed line in red color 
                                    further it shows intercept and the slope of the line. This regression model builds up with overall data with 
                                    original data set. ")),
                        
                        #First tab panel describe the plot 01
                        tabPanel("Figure 01", br(), plotlyOutput("whichplot"),
                                 em("Go to step 01. Select the continent and see the relationship of the gdp and 
                                    life expectency with time,population in each continent.")),
                        
                        #Scond tab panel descibe the plot 02
                        tabPanel("Figure 02", br(),plotOutput("plot1", brush = brushOpts(
                            id = "brush1")),em("Go to step 02. Select the area of this plot and It can be 
                                               obtained the intercept and slope of the regressed line."))
                        
                        
            )
    )
)))

