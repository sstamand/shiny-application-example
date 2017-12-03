---
title: "Shiny Application for Canada's Federal Transfer Payments"
author: "sstamand"
date: "December 3, 2017"
runtime: shiny
output: ioslides_presentation
---



Shiny App Description
========================================================
- This shiny app provides a clean way to extract information about the distribution of Fedearl transfer payments to Canadian provinces and territories over time.
- The app has two panels:
1. The first panel plots Federal transfer payments by province. It takes as input the year of transfer payments, with options to add or remove axis titles and create you own title.
2. The second panel displays the value of the transfer payments for a given province or territory and calculates the absolute and percentage change between two years. It takes as input a single province or territory and the range of years.

Panel 1: Bar Plot Example Code
========================================================

```r
inputPanel(
    sliderInput("year_plot", "Year:", min = 1980,
        max = 2017, value = 2017, sep = "")
)
renderPlot({
        year_input <- paste0("year_", input$year_plot)
        # draw the bar graph for selected year
        ggplot(data = fed_transfer, 
            aes(x = province, fed_transfer[,year_input])) +
            geom_col() + xlab("Province") + 
            ylab("Thousand CAD per person") +
            theme(axis.text=element_text(size=14), 
            axis.title.x=element_text(size=20), 
            axis.title.y=element_text(size=20))
})
```

Panel 1: Bar Plot Example
========================================================
<!--html_preserve--><div class="shiny-input-panel">
<div class="shiny-flow-layout">
<div>
<div class="form-group shiny-input-container">
<label class="control-label" for="year_plot">Year:</label>
<input class="js-range-slider" id="year_plot" data-min="1980" data-max="2017" data-from="2017" data-step="1" data-grid="true" data-grid-num="9.25" data-grid-snap="false" data-prettify-separator="" data-prettify-enabled="false" data-keyboard="true" data-keyboard-step="2.7027027027027" data-data-type="number"/>
</div>
</div>
</div>
</div><!--/html_preserve--><!--html_preserve--><div id="out2e9ba15979ec9153" class="shiny-plot-output" style="width: 100% ; height: 400px"></div><!--/html_preserve-->

Panel 2: Calculation Example
========================================================
<!--html_preserve--><div class="shiny-input-panel">
<div class="shiny-flow-layout">
<div>
<div class="form-group shiny-input-container">
<label class="control-label" for="year_calc">Year:</label>
<input class="js-range-slider" id="year_calc" data-type="double" data-min="1980" data-max="2017" data-from="1980" data-to="2017" data-step="1" data-grid="true" data-grid-num="9.25" data-grid-snap="false" data-prettify-separator="" data-prettify-enabled="false" data-keyboard="true" data-keyboard-step="2.7027027027027" data-drag-interval="true" data-data-type="number"/>
</div>
</div>
<div>
<div id="prov" class="form-group shiny-input-radiogroup shiny-input-container">
<label class="control-label" for="prov">Province/Territory:</label>
<div class="shiny-options-group">
<div class="radio">
<label>
<input type="radio" name="prov" value="Alberta" checked="checked"/>
<span>Alberta</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="British Columbia"/>
<span>British Columbia</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Manitoba"/>
<span>Manitoba</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="New Brunswick"/>
<span>New Brunswick</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Newfoundland"/>
<span>Newfoundland</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Nova Scotia"/>
<span>Nova Scotia</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Northwest Territories"/>
<span>Northwest Territories</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Nunuvat"/>
<span>Nunuvat</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Ontario"/>
<span>Ontario</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Prince Edward Island"/>
<span>Prince Edward Island</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Quebec"/>
<span>Quebec</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Saskatchewan"/>
<span>Saskatchewan</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="prov" value="Yukon"/>
<span>Yukon</span>
</label>
</div>
</div>
</div>
</div>
</div>
</div><!--/html_preserve--><!--html_preserve--><div id="out1ad33816db3eb3bd" class="shiny-text-output"></div><!--/html_preserve-->
