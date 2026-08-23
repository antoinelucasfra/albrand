# Demo Shiny app themed with albrand::bs_theme_brand()
# Run locally:
#   shiny::runGitHub("antoinelucasfra/albrand", subdir = "inst/shiny-demo")
# or from a package checkout:
#   shiny::runApp(system.file("shiny-demo", package = "albrand"))

library(shiny)

ui <- fluidPage(
  theme = albrand::bs_theme_brand(preset = "cosmo"),

  titlePanel(
    div(
      style = "display:flex; align-items:center; gap:.75rem;",
      img(src = "logo.svg", height = "42px", alt = "al-brand logo"),
      h2("al-brand · Shiny demo", style = "margin:0;")
    )
  ),

  navlistPanel(
    widths = c(3, 9),

    tabPanel(
      "Overview",
      h4("One identity everywhere"),
      p("This app is themed by the same ", code("brand.yml"),
        " that powers the", tags$a("Quarto extension",
        href = "https://antoinelucasfra.github.io/quarto-al-brand/",
        target = "_blank"), "."),
      wellPanel(
        h5("Sky-blue accent family"),
        p("Buttons, links, and focus states pick up the brand primary."),
        actionButton("go", "Primary action", class = "btn btn-primary btn-sm"),
        actionButton("reset", class = "btn btn-outline-secondary btn-sm", "Reset")
      ),
      uiOutput("stats")
    ),

    tabPanel(
      "Components",
      selectInput("var", "Distribution:", c("Normal" = "norm", "Exponential" = "exp")),
      sliderInput("n", "Sample size:", 100, 5000, 1000, step = 100),
      plotOutput("hist", height = "320px")
    )
  )
)

server <- function(input, output, session) {
  draws <- eventReactive(list(input$go, input$n), {
    if (identical(input$var, "exp")) rexp(input$n) else rnorm(input$n)
  }, ignoreNULL = FALSE)

  output$hist <- renderPlot({
    par(mar = c(4, 4, 1, 1))
    hist(draws(), col = "#38BDF8", border = "#0284C7",
         main = NULL, xlab = NULL, breaks = 40)
  })

  output$stats <- renderUI({
    n <- input$n
    fluidRow(
      column(4, wellPanel(h3(format(n, big.mark = ",")), p("samples"))),
      column(4, wellPanel(h3(round(mean(draws()), 2)), p("mean"))),
      column(4, wellPanel(h3(round(sd(draws()), 2)), p("sd")))
    )
  })
}

shinyApp(ui, server)
