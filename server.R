library(shiny)
BetaParams <- function(mu, se) {
        alpha <- ((1 - mu) / se^2 - 1 / mu) * mu ^ 2
        beta <- alpha * (1 / mu - 1)
        if(alpha <=0 | beta <= 0) print("No valid distribution with this numbers") 
        else c(alpha, beta)
}

shinyServer(
server <- function(input, output) {
        params <- reactive({BetaParams(input$mean, input$se)})
        output$alpha <- renderPrint({BetaParams(input$mean, input$se)[1]})
        output$beta <- renderPrint({BetaParams(input$mean, input$se)[2]})
        output$hist <- renderPlot({hist(rbeta(input$n,params()[1],params()[2]))})
        }
)

