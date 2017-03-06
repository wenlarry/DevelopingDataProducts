
# reactive operations that depend on widget input values to be performed outside
# of a render statement
# egsome codethat get reused in several render statements; do not want to 
# recaluculate it for each one
# x is executed as a function in the renderText

shinyServer(
 function(input,output){
  x<-reactive({as.numeric(input$text1)+100})
  output$text1<-renderText({x()})
  output$text2<-renderText({x()+as.numeric(input$text2)})
  output$text3<-renderText({
   input$goButton
   isolate(paste(input$text1,input$text2))
  })
})
