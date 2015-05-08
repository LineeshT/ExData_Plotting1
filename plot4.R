hpc <- read.csv("household_power_consumption.txt", sep=";")

#Convert to date type
hpc$Date <- as.Date(hpc$Date, format='%d/%m/%Y')

#Select the required date range
hpc <- subset(hpc, hpc$Date == as.Date('02/01/2007', format='%m/%d/%Y') | hpc$Date == as.Date('02/02/2007', format='%m/%d/%Y'))

#Create DateTime
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format='%Y-%m-%d %H:%M:%S')

#Select necessary columns
hpc <- hpc[,c(3:10)]

#Convert to numeric type
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))

#Draw plot in file
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

#Plot 1
plot(hpc$DateTime, hpc$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2
plot(hpc$DateTime, hpc$Voltage,  type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(hpc$DateTime,hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2, col="red")
lines(hpc$DateTime,hpc$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#Plot 4
plot(hpc$DateTime, hpc$Global_reactive_power,  type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off() 
