#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Competing Explanations"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("P1","Proficiency 1:",
                        c("Unknown"=0,"Low"=1,
                          "Medium"=2, "High"=3),
                        selected="Unknown"),
            selectInput("P2","Proficiency 2:",
                        c("Unknown"=0,"Low"=1,
                          "Medium"=2, "High"=3),
                        selected="Unknown"),
            selectInput("Y","Is Correct?:",
                        c("Unknown"=0,"No"=1,"Yes"=2),
                        selected="Unknown")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("graphPlot"),
           textOutput("P1"),textOutput("P2"),textOutput("Y")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  margins <- reactive({
    p1 <- c(1,1,1)
    p1[-as.numeric(input$P1)]<- 0
    p2 <- c(1,1,1)
    p2[-as.numeric(input$P2)] <- 0
    y <- c(1,1)
    y[-as.numeric(input$Y)] <- 0

    p1p2y <- array(c(.9,.7,.5,.7,.5,.3,.5,.3,.1,
                     .1,.3,.5,.3,.5,.7,.5,.7,.9),c(3,3,2)) *
        array(p1,c(3,3,2)) *
        array(rep(p2,each=3),c(3,3,2)) *
        array(rep(y,each=9),c(3,3,2))
    p1p2y <- p1p2y/sum(p1p2y)

    list(P1=apply(p1p2y,1,sum),
         P2=apply(p1p2y,2,sum),
         Y=apply(p1p2y,3,sum))
  })

  output$P1 <- renderText(paste("P(P1=L)=",round(margins()$P1[1],3),
                                ", P(P1=M)=",round(margins()$P1[2],3),
                                ", P(P1=H)=",round(margins()$P1[3],3)))

  output$P2 <- renderText(paste("P(P2=L)=",round(margins()$P2[1],3),
                                ", P(P2=M)=",round(margins()$P2[2],3),
                                ", P(P2=H)=",round(margins()$P2[3],3)))

  output$Y <- renderText(paste("P(correct)=",
                                round(margins()$Y[2],3)))
  output$y2 <- renderText(paste("P(Accident Year 2)=",
                                     round(margins()[3],3)))

  output$graphPlot <- renderPlot({
    plot(c(0,5),c(0,3),type="n",xaxt="n",yaxt="n",ylab="",xlab="",bty="n",
         bg="grey90")

    rect(c(0,0,4),c(0,2,1),c(1,1,5),c(1,3,2))
    arrows(c(1,1),c(0.5,2.5),c(4,4),c(1.5,1.5))
    text(c(0.5,0.5,4.5),c(1.25,1.75,.75),c("P1","P2","Response"))
    rect(c(0,0,4),c(0,2,1),c(0,0,4)+c(margins()$P1[3],margins()$P2[3],
                                      margins()$Y[2]),
         c(1,3,2),col="#782F40")
    rect(c(0,0)+c(margins()$P1[3],margins()$P2[3]),
         c(0,2),
         c(0,0)+c(margins()$P1[3],margins()$P2[3])+
           c(margins()$P1[2],margins()$P2[2]),
         c(1,3),col="#A6192E")
    })
}

# Run the application
shinyApp(ui = ui, server = server)
