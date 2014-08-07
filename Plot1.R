# Exploratory Data Analysis: Course Project 1: Plot 1

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

# Plot1 histogram using PNG device (png/plot/detach)
png("plot1.png", width=480, height=480)
hist(subset$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()

#clean up memory
rm(list=ls())

print("Please check your working directory for Plot1.png")
