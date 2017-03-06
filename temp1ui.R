library(shiny)

shinyUI(pageWithSidebar(
 headerPanel("Plot"),
 sidebarPanel(
  sliderInput('mu','Guess Mean',value=70,min=62,max=74,step=0.05)),
 mainPanel(
  plotOutput('newHist')
 )
))