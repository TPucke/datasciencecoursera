library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Comparison Tool For The Effect Of Diet On Chick Weight Gain"),
  
  # Sidebar with input controls
  sidebarLayout(
    sidebarPanel(
      h3("Select diet(s)"),
      checkboxInput("checkBoxOne", "One", FALSE),
      checkboxInput("checkBoxTwo", "Two", FALSE),
      checkboxInput("checkBoxThree", "Three", FALSE),
      checkboxInput("checkBoxFour", "Four", FALSE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("msg"),
      plotOutput("chickWeightPlot")
    )
  )
))
