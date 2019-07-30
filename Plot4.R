########## PLOT 4#############

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
png("plot4.png", width=480, height=480, units="px")


#Asign the layout for all four graphs
par(mfrow = c(2,2))

#Plot the first graph
plot(dateTime, Global_active_power,  type="l", xlab="", ylab="Global Active Power")

#Plot the second graph
plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot the third graph
plot(dateTime, Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime,  Sub_metering_2 , col="red")
lines(dateTime, Sub_metering_3 , col="blue")
legend("topright", lty=1, bty="n", cex = 0.75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

#Plot the fourth graph
plot(dateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Switch off the device
dev.off()
