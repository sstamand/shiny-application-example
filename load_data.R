library(shiny)
library(tibble)
library(dplyr)

setwd("C:/Users/saman/Documents/Coursera/Fun Project Ideas/Federal Equalization and Tranfer Payments/datafiles")

## Loan and clean data
info <- read.table("1.csv", sep = ",", header = TRUE, skip = 3, 
                   blank.lines.skip = TRUE) ## First file contains info

file_names <- info[,2] ## create vector for naming files

for(i in 1:length(file_names)) {
    assign(paste(file_names[i]), read.table(paste(i + 1, ".csv", sep = ""), 
                                            sep = ",", header = TRUE, 
                                            row.names = 1, skip = 5))
}


clean_data <- function(dataset){
    dataset <- dataset[2:nrow(dataset),]
    dataset <- data.frame(t(dataset[!((dataset$Total.Canada == 0)|is.na(dataset$Total.Canada)),]))
    dataset <- rownames_to_column(dataset, "province")
    dataset <- dataset[(dataset$province!="Total.Provinces" &             
                            dataset$province!="Total.Territories" &         
                            dataset$province!="Total.Canada"),]
    colnames(dataset) <- c("province", 1980:2017)
    return(dataset)
}

major_cash <- clean_data(major_cash)
population <- clean_data(population)

merged_data <- merge(major_cash, population, by = "province", suffixes = c("_cash", "_pop"))

fed_transfer <- data.frame(province = merged_data$province)

for (i in 2:(ncol(merged_data))) {
    fed_transfer[[i]] <- with(fed_transfer, merged_data[,i]/merged_data[,(i+38)])
}

cols <- "province"
for (i in 1980:2017) {
    cols <- c(cols, paste0("year_", i))
}

colnames(fed_transfer) <- cols

setwd("C:/Users/saman/Documents/Coursera/Assignments/Course 9/shiny app")
write.csv(fed_transfer, "fed_transfer_data.csv")

setwd("C:/Users/saman/Documents/Coursera/Assignments/Course 9/shiny app/canada_transfer_payments")
write.csv(fed_transfer, "fed_transfer_data.csv")
