library(shiny)
library(plot3D)
library(ggplot2)

ui <- fluidPage(
    titlePanel("Group2 Binplot Shiny Demonstration"),
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId="num",
                        label="Choose a number of points",
                        value=6000,min=1,max=10000),
            sliderInput(inputId="res",
                        label="choose a resolution",
                        value=70,min=1,max=250),
            checkboxInput(inputId = "log.transform",
                          label = "Binplots log10 (counts+1)",
                          value = F)
        ),

        mainPanel(
            tabsetPanel(
                tabPanel("Dataset #1",
                         fluidRow(
                             column(6, plotOutput("scatterplot")),
                             column(6, plotOutput("binplot"))
                         ),
                         fluidRow(
                             column(1), # add extra left margin space to ggplot2 binplot allowing for align up
                             column(5, plotOutput("ggbinplot")),
                             column(6, plotOutput("threeDplot"))
                         )
                ),

                tabPanel("Dataset #2",
                         fluidRow(
                             column(6, plotOutput("scatterplot2")),
                             column(6, plotOutput("binplot2"))
                         ),
                         fluidRow(
                             column(1), # add extra left margin space to ggplot2 binplot allowing for align up
                             column(5, plotOutput("ggbinplot2")),
                             column(6, plotOutput("threeDplot2"))
                         )


                )
            )
        )
    )
)



server <- function(input, output) {
    set.seed(123) # use the same set of random data for each shiny run

    # Define scatter plot function
    scatter <- function(x,y) {
        plot(x,y,main="Scatter Plot",
             xlab = "X", ylab = "Y")
    }

    # Define binplot function
    binplot <- function(x,y,res, log.transform = F) {
        nc <- res
        nr <- res
        zx = c(1:nr,rep(1,nc),1+trunc( nr*(x- min(x))/(max(x)-min(x)) ))
        zx[zx>nr] = nr
        zy = c(rep(1,nr),1:nc,1+trunc( nc*(y- min(y))/(max(y)-min(y)) ))
        zy[zy>nc] = nc
        z = table(zx,zy); z[,1]=z[,1]-1; z[1,]=z[1,]-1;
        if (log.transform == T) { z = log10(z + 1) }
        image(z=t(z),x=seq(length=nr+1,from=min(x),to=max(x)),
              y= seq(length=nc+1,from=min(y),to=max(y)),
              xlab="X",ylab="Y", col=topo.colors(100),
              main="Binned scatter plot")
    }

    # Define binplot by ggplot2
    bgplot <- function(x,y,res,scale="raw") {
        nc <- res
        nr <- res
        zx = c(1:nr,rep(1,nc),1+trunc( nr*(x- min(x))/(max(x)-min(x)) ))
        zx[zx>nr] = nr
        zy = c(rep(1,nr),1:nc,1+trunc( nc*(y- min(y))/(max(y)-min(y)) ))
        zy[zy>nc] = nc
        z = table(zx,zy)
        z[,1]=z[,1]-1
        z[1,]=z[1,]-1
        if (scale=="l") z= log(1+z)
        z <- as.data.frame(z)
        ggplot(data=z, aes(x=zx,y=zy,col=Freq))+
            geom_point()+
            scale_x_discrete(breaks=seq(min(x),max(x),nr+1)) +
            scale_y_discrete(breaks=seq(min(y),max(y),nr+1))+
            scale_color_viridis_c() +
            ggtitle("Binplot by ggplot2") + xlab("X") + ylab("Y")+
            coord_fixed(ratio = 1)
    }

    # Define 3-D plot
    TDbinplot <- function (x,y,res, log.transform = F){
        xc <- cut(x,res)
        yc <- cut(y,res)
        z = table(xc,yc)
        if (log.transform == T) { z = log10(z + 1) }
        hist3D(z=z, border="black",main="3D binned plot",
               xlab = "X", ylab = "Y", zlab = "counts")
    }


    # Generate output for dataset I (random normal)
    output$scatterplot<-renderPlot({
        scatter(rnorm(input$num),rnorm(input$num))
    })
    output$binplot<-renderPlot({
        binplot(rnorm(input$num),rnorm(input$num),input$res, input$log.transform)
    })
    output$ggbinplot<-renderPlot({
        bgplot(rnorm(input$num),rnorm(input$num), res = input$res, scale = input$log.transform)
    })
    output$threeDplot<-renderPlot({
        TDbinplot(rnorm(input$num),rnorm(input$num),input$res, input$log.transform)
    })


    # Generate output for dataset II (from defined equations)
    theta.length = reactive({input$num})
    theta = reactive({ seq(1, 1000, length.out = theta.length()) })
    a = reactive({ rep(0.1, each = theta.length()) })
    b = reactive({ rep(0.001, each = theta.length()) })
    spiral.x = reactive({ a() * cos(theta()) * exp(b() * theta()) })
    spiral.y = reactive({ a() * sin(theta()) * exp(b() * theta()) })

    output$scatterplot2<-renderPlot({
        scatter(spiral.x(), spiral.y())
    })
    output$binplot2<-renderPlot({
        binplot(spiral.x(), spiral.y(),input$res, input$log.transform)
    })
    output$ggbinplot2<-renderPlot({
        bgplot(spiral.x(), spiral.y(), res = input$res, scale = input$log.transform)
    })
    output$threeDplot2<-renderPlot({
        TDbinplot(spiral.x(), spiral.y(),input$res, input$log.transform)
    })


}

shinyApp(ui = ui, server = server)
