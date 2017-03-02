library(shiny) 
library(plotly) 

# Data
nation<-c("EU28","DE","UK","FR","IT","ES") 
USD<-c(13959739,2795700,1933613,1937806,1604114,1163000)  

ppp<-data.frame(nation,USD,stringsAsFactors = FALSE) 

ylim<- list(
        min=min(ppp$USD),
        max=max(ppp$USD) +3
)

shinyUI(fluidPage(

 h2("5 EU  Bubbles"), 
 
 tabPanel("Guide",
  mainPanel(
   h3("Nations 'DE' and 'ES' are Germany and Spain respectively") ,
   h3("Top 5 EU nations are those with PPP above US$1.0T"),
   h3("EU-28 is the aggregate PPP of all EU nations"),
   h3("Brexit Impact on the other top EU nations can be visualized"),
   h3("Purchasing Power Parity is a GDP measure"),
   br(),
   h4("Chart Usage - Hover over the bubble to get the PPP number") ,
   br(),
         
 plot_ly(ppp,x=~nation,y=~USD  ,type='scatter',mode='markers',
                size=c(3,3,2,2,2,1) ,
                
                marker=list(color=c("blue","red","green", "violet",
                                    "orange","yellow") )) %>%
  
                       layout(title='Purchasing Power Parity - EU Top5 - 2014'),
 
 
 fluidRow(
  shiny::column(4,offset=4,
   sliderInput("USD","Purchasing Power Parity in USD",value= min (ppp$USD),
    min = min(ppp$USD),max = max (ppp$USD),
    animate = TRUE)
))
))
))


