########## PLOT 1#############

#LOAD Data
data <- read.csv("C://Users//smonika//Desktop//Coursera//EDA//household_power_consumption.txt", sep=";")

#Filter date columns
data <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]
head(data) 

# Convert data to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Concatante Date and Time variables
data$dateTime = paste(data$Date, data$Time)

# Convert to Date/Time class
data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")
attach(data)


#Set PNG as the graphic device
png("plot1.png", width=480, height=480, units="px")


# Plot the global active power distribution
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Switch off the device
dev.off()



