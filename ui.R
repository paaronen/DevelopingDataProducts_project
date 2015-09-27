library(shiny)
shinyUI(fluidPage(
        headerPanel("Beta distribution with known mean and s.e."),
        sidebarPanel(
                numericInput(inputId = "mean", "Mean", value=0.5, min = 0, max = 1, step=0.01),
                numericInput(inputId = "se", "Standard error", value=0.1, min = 0, max = 1, step=0.01),
                numericInput(inputId = "n", "Sample size", value=25, min = 0),
                submitButton("Submit")
                ),
mainPanel(
h3("Parameters with n simulated variables"), 
h4("Alpha"),
verbatimTextOutput("alpha"),
h4("Beta"),
verbatimTextOutput("beta"),
plotOutput(outputId = "hist")
)
)
)
