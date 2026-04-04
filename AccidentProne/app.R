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
    titlePanel("Accident Prone Driver"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("ability","Driving Ability:",
                        c("Unknown"=-1,"Normal"=0,
                          "Accident Prone"=1),
                        selected="Unknown"),
            selectInput("y1","Accident Year 1:",
                        c("Unknown"=-1,"No"=0,"Yes"=1),
                        selected="Unknown"),
            selectInput("y2","Accident Year 2:",
                        c("Unknown"=-1,"No"=0,"Yes"=1),
                        selected="Unknown")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("graphPlot"),
           textOutput("ability"),textOutput("y1"),textOutput("y2")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  margins <- reactive({
      if (input$ability < 0) {
        ability <- c(1,1)
      } else {
        ability <- c(1-as.numeric(input$ability),as.numeric(input$ability))
      }
      if (input$y1 < 0) {
        y1 <- c(1,1)
      } else {
        y1 <- c(1-as.numeric(input$y1),as.numeric(input$y1))
      }
      if (input$y2 < 0) {
        y2 <- c(1,1)
      } else {
        y2 <- c(1-as.numeric(input$y2),as.numeric(input$y2))
      }

      ay1y2 <- array(c(.8,.2),c(2,2,2)) *
        array(c(.99,.9,.01,.1),c(2,2,2)) *
        array(c(rep(c(.99,.9),2),rep(c(.01,.1),2)),c(2,2,2)) *
        array(ability,c(2,2,2)) *
        array(rep(y1,each=2),c(2,2,2)) *
        array(rep(y2,each=4),c(2,2,2))
      ay1y2 <- ay1y2/sum(ay1y2)

      c(apply(ay1y2,1,sum)[2],apply(ay1y2,2,sum)[2],apply(ay1y2,3,sum)[2])
  })

  output$ability <- renderText(paste("P(Driver is Accident Prone)=",
                                     round(margins()[1],3)))
  output$y1 <- renderText(paste("P(Accident Year 1)=",
                                     round(margins()[2],3)))
  output$y2 <- renderText(paste("P(Accident Year 2)=",
                                     round(margins()[3],3)))

  output$graphPlot <- renderPlot({
    plot(c(0,5),c(0,3),type="n",xaxt="n",yaxt="n",ylab="",xlab="",bty="n",
         bg="grey90")

    rect(c(0,4,4),c(1,0,2),c(1,5,5),c(2,1,3))
    arrows(c(1,1),c(1.5,1.5),c(4,4),c(0.5,2.5))
    text(c(0.5,4.5,4.5),c(.75,1.25,1.75),c("Driving","Year 1","Year 2"))
    rect(c(0,4,4),c(1,0,2),c(0,4,4)+margins(),
         c(2,1,3),col="#A6192E")

    })
}

# Run the application
shinyApp(ui = ui, server = server)
