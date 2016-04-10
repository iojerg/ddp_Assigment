server <- function(input, output){
  #   renderDataTable()
  #   renderImage()
  output$Plot1 <- renderPlot({
    selectedData <- reactive({
      mtcars[, c(input$var2, input$var1)]
    })
    clusters <- reactive({
      kmeans(selectedData(), input$var4)
    })
    
    plot(selectedData(), col = clusters()$cluster,
         pch = 20, cex = 3) 
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    
  })
  
  output$table <- renderTable({
    selectedData <- reactive({
      mtcars[, c(input$var2, input$var1)]
    })
    clusters <- reactive({
      kmeans(selectedData(), input$var4)
    })
    data <- cbind(data.frame(Group = c(clusters()$cluster)),mtcars[,c(input$var1, input$var2)])
    data <- data[order(data$Group),]
    data
  })
  
  output$avg1 <- renderTable({
    selectedData <- reactive({
      mtcars[, c(input$var2, input$var1)]
    })
    clusters <- reactive({
      kmeans(selectedData(), input$var4)
    })
    data <- cbind(data.frame(Group = c(clusters()$cluster)),mtcars[,c(1,2)])
    avg_var1 <- with(data, aggregate(mtcars[,input$var1], by = list(Group), FUN = mean))
    avg_var2 <- with(data, aggregate(mtcars[,input$var2], by = list(Group), FUN = mean))
    names(avg_var1) <- c("Group", paste("Average", input$var1))
    names(avg_var2) <- c("Group", paste("Average", input$var2))
    data <- merge(avg_var1, avg_var2)
  })
  
}
