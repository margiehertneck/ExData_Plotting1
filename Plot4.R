# Exploratory Data Analysis: Course Project 1: Plot 4

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

# Plot4 includes 4 plots in a single set
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2)) 

# UPPERLEFT: Plot xy plot of global active power x weekdays
plot(subset$datetime, subset$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# LOWERLEFT: Plot xyplot (multi-line) comparing sub metering (with legend)
x <- subset$datetime
y1 <- subset$Sub_metering_1
y2 <- subset$Sub_metering_2
y3 <- subset$Sub_metering_3
plot(x,y1,type = "l",ylab="Energy sub metering", xlab="")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1,bty="n",col= c("black","red","blue"))

# UPPERRIGHT: Plot xyplot (line) for voltage and datetime
plot(subset$datetime, subset$Voltage, type="l",
     ylab="Voltage", xlab="datetime")

# LOWERRIGHT: Plot xyplot(line) for Global_reactive_power and datetime
plot(subset$datetime, subset$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.off()

#clean up memory
rm(list=ls())

print("Please check your working directory for Plot4.png")
