Coursera Data Science Specialization: Build a Shiny Application
Version 1.0
==============================================================================
Description

This shiny app provides an a clean way to extract information about the 
distribution of Federal transfer payments to Canadian provinces and territories 
over time.

==============================================================================

The GitHub repository includes the following files:

'canada_transfer_payments/': This folder contains the files needed to run the app

	'fed_transfer.csv': The dataset used in the shiny app

	'server.R': Server file 

	'ui.R': UI file

'fed_transfer.csv': The dataset used in the shiny_app_presentation

'load_data.R': R code used to load and clean the original dataset

'shiny_app_presentation.Rmd': R Markdown presentation file

'shiny_app_presentation.md': Markdown presentaiton file

==============================================================================

Using the Shiny App

The interactive shiny app is available at this link:
	 https://www.shinyapps.io/admin/#/application/243391

The app contains two panels:

1. Bar Plot
   The first panel plots Federal transfer payments by province in a specified 
   year. It takes as input the year of transfer payments, with options to add 
   or remove axis titles and create you own title. The "Refersh Graph" button
   must be pressed to refresh the graph.

2. Change Calculation
   The second panel displays the value of the transfer payments for a given 
   province or territory and calculates the absolute and percentage change 
   between two years. It takes as input a single province or territory and the 
   range of years within which to calculate the change in payments received.
   The "Refresh Calculation" button must be pressed to refresh the calculated
   value.

==============================================================================

Presentation Pitch

The presentation pitch for the shiny app is available at this link:
	https://sstamand.shinyapps.io/shiny_app_presentation/

The pitch provides a brief overview of the purpose of the application and
includes a simplified example of how the application works.