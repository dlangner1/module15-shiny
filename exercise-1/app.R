# load the "shiny" library
library("shiny")


# Define a new `ui` variable. This variable should be assigned a `fluidPage` layout

my.ui <- fluidPage(
  # Include a `titlePanel` layout with the text "Cost Calculator"
  titlePanel("Cost Calculotor"),
  
  # Include a `numericInput()` widget with the label "Price (in dollars)"
  # It should have a default value of 0 and a minimum value of 0
  # Hint: look up the function in the documentation!
  numericInput('cost', "Price (in dollars)", 0, 0),

  # Include a `numericInput()` widget with the label "Quantity"
  # It should have a default value of 1 and a minimum value of 1
  numericInput('quantity', "Quantity", 1, 1),


  # Include the word "Cost" strongly bolded
  strong("Cost"),
  # Include a `textOutput()` output of the calculated `cost`
  textOutput('cost')
)

# Define a `server` function (with appropriate arguments)# Define a `server` function (with appropriate arguments)

my.server <- function(input, output) {
  # Assign a reactive `renderText()` function to the outputted `cost`
  # The reactive expression should return the inputed `price` times the `quantity`
  # So it looks nice, paste a "$" in front of it!
  
  output$cost <- renderText({
    cost <- paste0("$", input$cost * input$quantity)
    return(cost)
  })
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = my.ui, server = my.server)
