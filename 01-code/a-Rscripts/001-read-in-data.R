library (googlesheets4)
library (tibble)
library (dplyr)
library (here)
library (ggplot2)

## this command allows you to see if there are any authorized connections to google drive accounts and if not, to set one up. remember to allow full access to files
gs4_auth()

## read_sheet command in googlesheets4 (gs4) package allows you to pull a google sheet. copy the sheet link from the share button in google sheets (so it has the https)
microplastics_data = read_sheet ("https://docs.google.com/spreadsheets/d/1duR-A9_DEB-wiN004qiEAkENk5adQfcvvbG1ZF64WT0/edit?usp=sharing", col_types = c("ccccnnciinnnnin"))

write.csv(microplastics_data, here::here("00-data", "a-raw", "microplastics_data_raw.csv"))

# Read in spatial data
microplastics_data_raw = read.csv(here::here("00-data", "a-raw", "microplastics_data_raw.csv"))

# Generate microplastic content by soil depth figure 
jpeg("microplastic contents soil depth 31JUL2024.jpg",
     width = 8*300,
     height = 8*220,
     res = 400,
     pointsize = 8)

layout.matrix <- matrix(c(1,2,3), nrow = 1, ncol = 3)
layout(mat = layout.matrix)
## layout.show(1,2,3)
par(mar = c(5, 4.5, 20, 1))

plot(microplastics_data$Number_of_Microplastics ~ microplastics_data$Average_Depth, xlab="Average Depth (cm)", ylab="Microplastics Content")

dev.off()

# Generate microplastic content by soil depth figure 
jpeg("microplastic contents soil depth 31JUL2024.jpg",
     width = 8*300,
     height = 8*220,
     res = 400,
     pointsize = 8)

layout.matrix <- matrix(c(1,2,3), nrow = 1, ncol = 3)
layout(mat = layout.matrix)
## layout.show(1,2,3)
par(mar = c(5, 4.5, 20, 1))

boxplot(microplastics_data$Site_Type ~ microplastics_data$Number_of_Microplastics, xlab="Number of Microplastics", ylab="Site Type")
axis(1, at=1:2, lab=c("Community Garden/Urban Farm", "Park/Green Space"))

dev.off()
