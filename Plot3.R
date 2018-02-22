# Plot 3 of 4 Codes
# Line Chart for Energy Sub Metering


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
plot(hpc$time3,hpc$SubM1,type="s",xlab="",ylab="Energy sub metering")
lines(hpc$time3,hpc$SubM2, col="Red")
lines(hpc$time3,hpc$SubM3, col="Blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## Save File
dev.copy(png, file="plot3.png",height=480,width=480)
dev.off()
detach(hpc)

# END