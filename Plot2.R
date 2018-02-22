# Plot 2 of 4 Codes
# Line Chart for Variable Global Active Power


## Set Working Directory and Load Data
library(data.table)

setwd("C:\\Users\\Asus\\Desktop\\datasciencecoursera")
data <- ".\\household_power_consumption.txt"
hpc <- fread(data, col.names=c("date", "time","GAP","GRP","Vltg","GI","SubM1","SubM2","SubM3"),na.strings = "?")

## Convert Variable date to class "Date"
library(lubridate)
hpc$date <- dmy(hpc$date)

## Subset the Data 
hpc <- subset(hpc,subset=(hpc$date >= "2007-02-01" & hpc$date <= "2007-02-02"))


## Convert dates and times
hpc$time3 <- as.POSIXct(paste(hpc$date,hpc$time), format="%Y-%m-%d %H:%M:%S")

## Generate the Graph
attach(hpc)
plot(hpc$time3,hpc$GAP,type="s",xlab="",ylab="Global Active Power (kilowatts)")

## Save File
dev.copy(png, file="plot2.png",height=480,width=480)
dev.off()
detach(hpc)

# END