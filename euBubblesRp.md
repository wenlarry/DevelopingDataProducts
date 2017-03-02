EU Bubbles
========================================================
wenlarry

March 2017

font-family:'comic sans'

Top 5 EU nations by PPP
========================================================

 5 out of 28 nations have Purchasing Power Parity above US$1trillion in 2014

 Rankings - Germany (DE), UK, France(FR), Italy (IT) and Spain (ES)

 Brexit impact on the top 5 nations can be visualized
 
 Purchasing Power Parity is a GDP measure

Data Crunch
========================================================


```r
 library (eurostat)
 library (rvest)
 library (dplyr) 
```
 Extract the 'Gross domestic product' dataset from the R package 'Eurostat'
 
 Filter the required nations (geo) and Year using 'R Tools for Eurostat Data'
 
 R Tools for Eurostat Data is in GITHUB depository 'rOpenGov/eurostat'
 
 Use dplyr to further slice, select and rename to get purchasing power parity in USD
 
 Construct a dataframe (ppp) from 2 vectors 'nation' and 'USD'
 
 Use Plotly to plot from dataframe in Shiny's ui
 
Dataframe Code
=================================
From 'eurostat' download to 'ppp dataframe'


```r
id<-search_eurostat("Gross domestic product", type="dataset")$code[1]
print id
dat<- get_eurostat("nama_10r_2gdp", time_format="num")
dat1<-get_eurostat ("nama_10r_2gdp", filters=list(geo=c("EU28","DE","UK","FR",
                                                          "IT","ES"),
                                                   lastTimePeriod = 1),
type="label", time_format="num") 

dat2<-slice(dat1,1:6)
dat3<-slice(dat1,19:24)%>%select(2:4)
dat4<-rename(dat3, USD=values)
# Construct data frame
nation<- c("EU28", "DE","UK","FR","IT","ES")
USD<- (13959739,2795700, 1933613,1937806,1604114,1163000)

ppp<-data.frame(nation,USD) 
```
Bubble Chart Code
===================================
A plotly Bubble Chart !  


```r
library (plotly)

ppp<-data.frame(nation,USD) # from above slide

P1<- plot_ly (ppp,x=nation,y=USD,type='scatter',mode='markers',
              size=c(2,3,2,2,2,1),
              marker=list(color=c("blue","red","green","violet",
                                  "orange","yellow")))%>%
              layout(title='Purchasing Power Parity - EU Top 5 - 2014')
P1
```
PITCH
====================

 Bubbles to 'Click'

 Bubbles show PPP or other choices

 More color bubbles are possible (data dependent)

 Just access extensive database to pull and massage required data eg Eurostat and 
  its tool
  
 Plotly or others can provide interactive charts

 Plug Charts into Shiny and Play 
