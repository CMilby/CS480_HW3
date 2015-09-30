
#install and load
#install.packages("shiny")
library(shiny)

#shiny server connnection
shinyServer(function(input, output) {
  
  #output is called distPlot
  output$distPlot <- renderPlot({
    
    # x saves the yrdx
    x <- cancer[,10]
    # number of columns
    bins <- seq(min(x), max(x), length.out = length(unique(cancer$yrdx)))
    
    # plot
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})