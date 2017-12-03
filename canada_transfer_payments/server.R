library(shiny)
library(ggplot2)

fed_transfer <- read.csv("fed_transfer.csv")

# Define server logic required to draw a bar plot
shinyServer(function(input, output) {
    output$barPlot <- renderPlot({
        year_input <- paste0("year_", input$year_plot)
        xlab <- ifelse(input$show_xlab, "Province", "")
        ylab <- ifelse(input$show_ylab, "Thousand CAD per person", "")
        title <- input$title
    
        # draw the bar graph for selected year
        ggplot(data = fed_transfer, 
                aes(x = province, y = fed_transfer[,year_input])) +
                geom_col() +
                xlab(xlab) +
                ylab(ylab) +
                ggtitle(title) +
                theme(axis.text=element_text(size=14),
                      title=element_text(size = 24),
                      axis.title.x=element_text(size=20),
                      axis.title.y=element_text(size=20))
    
    })
    # calculate value change from start to end year
    provinces <- c("Alberta","British Columbia", "Manitoba", "New Brunswick", 
                    "Newfoundland", "Nova Scotia", "Northwest Territories", 
                    "Nunuvat", "Ontario", "Prince Edward Island", "Quebec", 
                    "Saskatchewan", "Yukon")
    output$end_value <- reactive({
        prov_index <- which(provinces == input$prov)
        end_year <- paste0("year_", input$year_calc[2])
        calculation <- round((fed_transfer[prov_index,end_year])*1000)
        paste0("The total Canadian dollar Federal transfer payments
               allocated in ", input$prov, " per person in ", 
               input$year_calc[2], " was $", 
               calculation, ".")
    })
    output$start_value <- reactive({
        prov_index <- which(provinces == input$prov)
        start_year <- paste0("year_", input$year_calc[1])
        calculation <- round((fed_transfer[prov_index,start_year])*1000)
        paste0("The total Canadian dollar Federal transfer payments
               allocated in ", input$prov, " per person in ", 
               input$year_calc[1], " was $", 
               calculation, ".")
    })
    output$calc_value <- reactive({
        prov_index <- which(provinces == input$prov)
        start_year <- paste0("year_", input$year_calc[1])
        end_year <- paste0("year_", input$year_calc[2])
        calculation <- round((fed_transfer[prov_index,end_year] - 
                                fed_transfer[prov_index,start_year])*1000)
        paste0("The absolute change in Canadian dollar Federal transfer payments
                allocated in ", input$prov, " per person from ", 
                input$year_calc[1], " to ", input$year_calc[2], " $", 
                calculation, ".")
    })
    # calculate percentage change from start to end year
    output$calc_percent <- reactive({
        prov_index <- which(provinces == input$prov)
        start_year <- paste0("year_", input$year_calc[1])
        end_year <- paste0("year_", input$year_calc[2])
        calculation <- round(((fed_transfer[prov_index,end_year]/
                                  fed_transfer[prov_index,start_year])-1)*100)
        paste0("The percent change in Canadian dollar Federal transfer
                payments allocated in ", input$prov, " per person from ",
                input$year_calc[1], " to ", input$year_calc[2], " %", 
                calculation, ".")
    })
})
