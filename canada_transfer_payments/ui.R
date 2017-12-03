library(shiny)

fed_transfer <- read.csv("fed_transfer.csv")

shinyUI(navbarPage("Interactive Transfer Payments",
    tabPanel("Bar Plot",
        titlePanel("Canada Federal Transfer Payments (1980-2017)"),
        sidebarLayout(
            sidebarPanel(
                sliderInput("year_plot",
                   "Year:",
                   min = 1980,
                   max = 2017,
                   value = 2017,
                   sep = ""),
            textInput("title", "Assign Title:"),
            checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
            submitButton("Refresh Graph"),
            h5("Legend:"),
            h6("AL: Alberta"),
            h6("BC: British Colombia"),
            h6("MB: Manitoba"),
            h6("NB: New Brunswick"),
            h6("NL: Newfoundland"),
            h6("NS: Nova Scotia"),
            h6("NT: Northwest Territories"),
            h6("NU: Nunavut"),
            h6("ON: Ontario"),
            h6("PE: Prince Edward Island"),
            h6("QC: Quebec"),
            h6("SK: Saskatchewan"),
            h6("YT: Yukon")
        ),
    
        mainPanel(
            plotOutput("barPlot"),
            h5("Note: This graph shows total Canadian federal government 
                transfer payments to each of the 10 provinces and 3 territories 
                from 1980 to 2017. Use the slides to change the year that is 
                displayed.")
    ))),
    tabPanel("Change Calculation",
        titlePanel("Change in Transfer Payments by Province"),
        sidebarLayout(
            sidebarPanel(
                sliderInput("year_calc",
                    "Year:",
                    min = 1980,
                    max = 2017,
                    value = c(1980,2017),
                    sep = ""),
                radioButtons("prov", "Province/Territory:",
                                   choices=c("Alberta","British Columbia", 
                                             "Manitoba", "New Brunswick", 
                                             "Newfoundland", "Nova Scotia", 
                                             "Northwest Territorieinstall.packages('rsconnect')s",
                                             "Nunuvat", "Ontario", 
                                             "Prince Edward Island", "Quebec", 
                                             "Saskatchewan", "Yukon")),
                submitButton("Refresh Calculation")
            ),
                 
        mainPanel(
            h4(textOutput("start_value")),
            h4(textOutput("end_value")),
            h4(textOutput("calc_value")),
            h4(textOutput("calc_percent"))
        ))
    )
))

