library(shiny)
shinyUI(fluidPage(
 titlePanel("Random"),
 sidebarLayout(
 sidebarPanel(
  numericInput("numeric", "How many ?",
               value=1000,min=1,max=1000,step=1),
  sliderInput("sliderX", "Pick min/max X values",
              -100,100,value=c(-50,50)),
  sliderInput("sliderY"," Pick min/max Y values",
              -100,100,value=c(-50,50)),
  checkboxInput("show_xlab","Show/Hide X axis label", value=TRUE),
  checkboxInput("show_ylab","Show/Hide Y axis label", value=TRUE),
  checkboxInput("show_Title","Show/Hide Title")
),
mainPanel(
 h3("Graph Random Points"),
 plotOutput("plot1")
))))