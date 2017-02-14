#Quiz 1
#Q2
library(shiny)
shinyUI(pageWithSidebar(   
        headerPanel("Data Science"),
        sidebarPanel(  
                h2('Big Text')
                h3('Sidebar')
        ),
        mainPanel(
                h3('Main Panel')
        )))
# Missing comma in sidebar panel after h3

#Q3
ShinyUI
mainPanel(
 plotOutput('newlist')
 
shinyServer
 output$myHist<-renderPlot({

# Server.R output name differs from plotOutput command in ui.R
         
         