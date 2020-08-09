myglmnet = function(z, y, a=0.5) {
  # Center and scale variables
  z = as.matrix(t((t(z)-apply(z,2,mean))/apply(z,2,sd))) 
  plot(u<-cv.glmnet(z,y,alpha=a)) # Find lambda by CV 
  # Plot full solution path
  plot(glmnet(z,y,alpha=a )) 
  lam=c(u$lambda.1se,u$lambda.min)
  v <- glmnet(z,y,alpha=a,lambda=lam)
  # Plot Lambda path
  plot(v)
  # Output lambda and estimates list(lambda=lam,beta=v$beta)
}



##############################################################


library(shiny)
library(glmnet)
library(readxl)
library(DT)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput('csvfile', 'Choose CSV File',
                accept=c( ".csv")
      
    ),
      sliderInput(inputId="a",
                  label="choose alpha value for elastic net regression",
                  value=0.5,min=0,max=1)
    ),
    mainPanel(
      
      tabsetPanel(
        tabPanel("Input data",
          dataTableOutput("contents")
        ),
        tabPanel("Elastic Net regression",
                 plotOutput("replot")
        ),
        
        tabPanel("Lasso regresssion(a=1)",
                 plotOutput("replot2")
        ),
        
        tabPanel("Ridge regresssion(a=0)",
                 plotOutput("replot3")
        )
      )
    )
  )
)

        

server <- function(input, output) {
  
  data <- reactive({ 
    req(input$csvfile) ## ?req #  require that the input is available
    inFile <- input$csvfile
    
    if (is.null(inFile))
      return(NULL)
    
    df <- read.csv(inFile$datapath)
    return(df)
  })
  
  output$contents <- renderDataTable({
    data()
  })
  
  output$replot <- renderPlot({
    par(mfrow=c(1,3))
    myglmnet(data()[,1:8],data()[,9], a=input$a)
  })
  
  output$replot2 <- renderPlot({
    par(mfrow=c(1,3))
    myglmnet(data()[,1:8],data()[,9],a=1)
  })
  
  output$replot3 <- renderPlot({
    par(mfrow=c(1,3))
    myglmnet(data()[,1:8],data()[,9],a=0)
  })
}


shinyApp(ui, server)



