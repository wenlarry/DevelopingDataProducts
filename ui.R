library(shiny) 
library(plotly) 
library(crayon)

# Data
nation<-c("EU28","DE","UK","FR","IT","ES") 
ppp<-c(13959739,2795700,1933613,1937806,1604114,1163000)
ppppc<-c(27500,34500,29900,29300,26400,27500) 

PPP<-data.frame(nation,ppp,ppppc,stringsAsFactors = FALSE) 

slope <-8.666051223553066e-05 
PPP$ppp<- sqrt(PPP$ppp* slope)
colors <- c('red','green','blue','yellow','orange','violet')

xlim<-list(
       min = min(PPP$ppppc)-500,
       max = max(PPP$ppppc)+500
)
ylim<- list(
        min=min(PPP$ppp),
        max=max(PPP$ppp) +3
)

shinyUI(fluidPage(
        
h2("Brexit"), 
        
 plot_ly(PPP,x=~ppppc,y=~ppp, color=~nation,size= ~ppppc, colors = colors, 
         type='scatter',mode='markers',
         sizes= c(min(PPP$ppp), max(PPP$ppp)),
         marker = list(symbol = 'circle', sizemode = 'diameter',
         line = list(width = 2, color = '#FFFFFF')),
         text = ~paste('nation:',nation , '<br>PPP:',ppp,'<br>PPP per cap:',      
                        ppppc))%>% 
        
         layout(title = 'BREXIT',
         xaxis = list(title = 'PPP per capita (USD)',
         gridcolor = 'rgb(255, 255, 255)',
         range = c(250,350),
         zerolinewidth = 1,
         ticklen = 5,
         gridwidth = 2),
         yaxis = list(title = 'PPP (USD_M)',
         gridcolor = 'rgb(255, 255, 255)',
         range = c(1000,14000),
         zerolinewidth = 1,
         ticklen = 5,
         gridwith = 2)),



 fluidRow(
  shiny::column(3,offset=0,
  sliderInput("ppppc","PPP per capita ",  
         min = min(PPP$ppppc),max= (PPP$ppppc),
         value = min (PPP$ppppc),animate = TRUE))),
                                 

tabPanel("Guide",
         fluidRow(
                 h3("Brexit impact by PPP"),
                 br(),
                 h4("Nations 'DE' and 'ES' are Germany and Spain respectively") ,
                 h4("Top 5 EU nations are those with PPP above US$1.0T"),
                 h4("EU-28 is the aggregate PPP of all EU nations"),
                 h4("Purchasing Power Parity is a GDP measure"),
                 h4("xaxis = PPP per capita; yaxis = PPP Notional"),
                 br(),
                 h4("Hover over the bubble to get the PPP number"))))

)