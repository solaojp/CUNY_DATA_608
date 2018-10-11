#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
bsl <- read.csv(url('https://raw.githubusercontent.com/solaojp/CUNY_DATA_608/master/module3/data/cleaned-cdc-mortality-1999-2010-2.csv'))

# Define server logic required to draw a histogram
shinyServer <- function(input, output,sessions) {
  
  output$plot1 <- renderPlot ({
    filtered <-  bsl %>%
      filter(Year == input$Year,
             ICD.Chapter == input$ICD.Chapter)
      ggplot(filtered, aes(x = reorder(State,Crude.Rate),y = Crude.Rate)) + geom_bar(color = 'red',stat = "identity")
  })
  
  output$plot2 <- renderPlot ({
                  data <- bsl %>%
                          group_by(ICD.Chapter, Year) %>%
                          mutate(Avg = round((sum(Deaths) / sum(Population)) * 10000000, 1))%>%
                          select(ICD.Chapter, State, Year, Crude.Rate, Avg) %>%
                          filter(ICD.Chapter == input$ICD.Chapter)
                  
                          data$State = as.character(data$State)
                          data$ICD.Chapter = as.character(data$ICD.Chapter)
                          
                          ggplot(data, aes(x = State,y = Avg )) + geom_line(color = 'blue',stat = "identity")

                  
    })    
}  





