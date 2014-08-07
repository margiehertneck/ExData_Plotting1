# Exploratory Data Analysis: Course Project 1: Plot 3

print("Downloading data may take a moment...")

#read file
file <- "household_power_consumption.txt"
data<-read.table(file,header=TRUE,sep=";",na.strings="?")

# format date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset on 2007-02-01 through 2007-02-02 timeframe
subset <- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")

# format Time
subset$Time <- as.character(subset$Time)

# make space in memory; remove unneeded dataset
rm(data)

# combine date and time in new variable & format
subset$datetime <-paste(subset$Date,subset$Time)
subset$datetime <- as.POSIXct(subset$datetime)

# Plot3 xyplot (line) using PNG device (png/plot/detach)
png("plot3.png", width=480, height=480)
x <- subset$datetime
y1 <- subset$Sub_metering_1
y2 <- subset$Sub_metering_2
y3 <- subset$Sub_metering_3
plot(x,y1,type = "l",ylab="Energy sub metering", xlab="")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2.5,col= c("black","red","blue"))
dev.off()

#clean up memory
rm(list=ls())

print("Please check your working directory for Plot3.png")