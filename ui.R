
#install shiny
install.packages("shiny")
library(shiny)

# create a ui page
shinyUI(
  #fluid page
  fluidPage(
    # main panel
    mainPanel(
      # plot histogram
      plotOutput("distPlot")
    )
  )
)
