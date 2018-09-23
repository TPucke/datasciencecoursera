library(shiny)
library(ggplot2)
data("ChickWeight")

# Define server logic
shinyServer(function(input, output) {
  useRow <- reactive({
    dietsToPlot <- factor()
    if (input$checkBoxOne) dietsToPlot <- c(dietsToPlot, 1)
    if (input$checkBoxTwo) dietsToPlot <- c(dietsToPlot, 2)
    if (input$checkBoxThree) dietsToPlot <- c(dietsToPlot, 3)
    if (input$checkBoxFour) dietsToPlot <- c(dietsToPlot, 4)
    
    ChickWeight$Diet %in% dietsToPlot
  })

  output$chickWeightPlot <- renderPlot({
    row <- useRow()
    df <- data.frame(Weight = ChickWeight$weight[row], 
                     Time = ChickWeight$Time[row],
                     Chick = ChickWeight$Chick[row],
                     Diet = ChickWeight$Diet[row])
    if (nrow(df) == 0) {
      return
    }
    else {
      ggplot(df, aes(Time, Weight, group = Chick)) +
        geom_line() +
        geom_point() +
        facet_grid(. ~ Diet, labeller = facetLabels) +
        geom_smooth(se = F, aes(group = 1), size = 3, color = alpha("red", .3))
    }
  })
  
})

facetLabels <- function(x) {
  lapply(x, function(y) {paste("Diet",y)})
}