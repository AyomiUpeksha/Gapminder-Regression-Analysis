#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(gapminder)
library(tidyverse)

shinyServer(function(input, output) {
    
    # rendering the first plot
    output$whichplot <- renderPlotly({
        if(input$plotnumber == ""){
            df1 <- gapminder
            p <- plot_ly(df1,
                         x = ~gdpPercap, 
                         y = ~lifeExp, 
                         size = ~pop, 
                         color = ~continent, 
                         frame = ~year, 
                         text = ~country, 
                         hoverinfo = "text",
                         type = 'scatter',
                         mode = 'markers'
            )
            p <- p %>% layout(
                xaxis = list(
                    type = "log"
                )
            )
        }
        if(input$plotnumber == "Africa"){
            df2 <- gapminder%>% filter(continent=="Africa")
            
            p <- plot_ly(df2,
                           x = ~gdpPercap, 
                           y = ~lifeExp, 
                           size = ~pop, 
                           color = ~continent, 
                           frame = ~year, 
                           text = ~country, 
                           hoverinfo = "text",
                           type = 'scatter',
                           mode = 'markers'
            )
            p <- p %>% layout(
                xaxis = list(
                    type = "log"
                )
            )
        }
        if(input$plotnumber == "Americas"){
            df3 <- gapminder%>% filter(continent=="Americas")
            
            p <- plot_ly(df3,
                         x = ~gdpPercap, 
                         y = ~lifeExp, 
                         size = ~pop, 
                         color = ~continent,
                         frame = ~year, 
                         text = ~country, 
                         hoverinfo = "text",
                         type = 'scatter',
                         mode = 'markers'
            )
            p <- p %>% layout(
                xaxis = list(
                    type = "log"
                )
            )
        }
        if(input$plotnumber == "Asia"){
            df4 <- gapminder%>% filter(continent=="Asia")
            
            p <- plot_ly(df4,
                         x = ~gdpPercap, 
                         y = ~lifeExp, 
                         size = ~pop, 
                         color = ~continent, 
                         frame = ~year, 
                         text = ~country, 
                         hoverinfo = "text",
                         type = 'scatter',
                         mode = 'markers'
            )
            p <- p %>% layout(
                xaxis = list(
                    type = "log"
                )
            )
        }
        if(input$plotnumber == "Europe"){
            df5 <- gapminder%>% filter(continent=="Europe")
            
            p <- plot_ly(df5,
                         x = ~gdpPercap, 
                         y = ~lifeExp, 
                         size = ~pop, 
                         color = ~continent, 
                         frame = ~year, 
                         text = ~country, 
                         hoverinfo = "text",
                         type = 'scatter',
                         mode = 'markers'
            )
            p <- p %>% layout(
                xaxis = list(
                    type = "log"
                )
            )
        }
        if(input$plotnumber == "Oceania"){
            df6 <- gapminder%>% filter(continent=="Oceania")
            
            p <- plot_ly(df6,
                         x = ~gdpPercap, 
                         y = ~lifeExp, 
                         size = ~pop, 
                         color = ~continent, 
                         frame = ~year, 
                         text = ~country, 
                         hoverinfo = "text",
                         type = 'scatter',
                         mode = 'markers'
            )
            p <- p %>% layout(
                xaxis = list(
                    type = "log"
                )
            )
        }
        p
    })
    #For the second tab Panel render the second plot
    output$plot1 <- renderPlot({
        
            model <- reactive({
                brushed_data <- brushedPoints(gapminder, input$brush1,
                                              xvar = "gdpPercap", yvar = "lifeExp")
                if(nrow(brushed_data) < 2){
                    return(NULL)
                }
                lm(lifeExp ~ gdpPercap, data = brushed_data)
            })
            output$slopeOut <- renderText({
                if(is.null(model())){
                    "No Model Found"
                } else {
                    model()[[1]][2]
                } 
            })
            output$intOut <- renderText({
                if(is.null(model())){
                    "No Model Found"
                } else {
                    model()[[1]][1]
                }
            })
            xlab <- ifelse(input$showX,"gdpPercap","")
            ylab <- ifelse(input$showY,"lifeExp","")
            p <- plot(gapminder$gdpPercap, gapminder$lifeExp, xlab = xlab,
                      ylab = ylab, main = "life Expectency with GDP Per Capita",
                      cex = 0.8, pch = 16, bty = "n",col=gapminder$continent)  
            print(p)
            if(!is.null(model())){
                abline(model(), col = "red", lwd = 2)
            }
        
    })
})
