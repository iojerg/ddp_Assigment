ui <- shinyUI(fluidPage(
  titlePanel("Hieralchical Clustering in mtcars dataset"),
  fluidRow(column(4,
                  selectInput(inputId = "var1", label = "Choose Variable 1", names(mtcars)),
                  selectInput(inputId = "var2", label = "Choose Variable 2", names(mtcars), selected = names(mtcars)[[4]]),
                  numericInput(inputId = "var4", label = "Select Number of Clusters", value = 3, min = 1, max = 5)
          ),
  column(4,tableOutput(outputId = "avg1")),
  column(4,tableOutput(outputId = "avg2"))
          ),
  column(6,plotOutput(outputId = 'Plot1')),
  column(6,tableOutput(outputId = "table"))
  
))
