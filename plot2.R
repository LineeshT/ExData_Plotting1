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
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))

#Draw plot in file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(hpc$DateTime, hpc$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() 
