# Plot 4 of 4 Codes
# Line Charts (2 by 2)


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

## Specify dimension
par(mfrow=c(2,2))

## Generate the Graph
attach(hpc)
# Plot 1
plot(hpc$time3,hpc$GAP,type="s",xlab="",ylab="Global Active Power (kilowatts)")
# Plot 2
plot(hpc$time3,hpc$Vltg,type="s",xlab="datetime",ylab="Voltage")
# Plot 3
plot(hpc$time3,hpc$SubM1,type="s",xlab="",ylab="Energy Submetering")
lines(hpc$time3,hpc$SubM2, col="Red")
lines(hpc$time3,hpc$SubM3, col="Blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Plot 4
plot(hpc$time3,hpc$GRP,type="s",xlab="datetime",ylab="Global_reactive_power")

## Save File
dev.copy(png, file="plot4.png",height=480,width=480)
dev.off()
detach(hpc)

# END