library(UsingR)
data(galton) 

shinyServer(
 function(input,output){
  output$newHist<-renderPlot({
   hist(galton$child,xlab='child height',col='red',main='Histogram') 
   mu<-input$mu
   lines(c(mu,mu),c(0,200), col='orange',lwd=5)
   mse<-mean((galton$child-mu)^2)
   text(63,150, paste("mu=",mu))
   text(63,140,paste("MSE=",round(mse,2)))
  })
 }) 