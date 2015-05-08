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

#Draw plot in file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(hpc$Global_active_power, xlab='Global Active Power(kilowatts)', main='Global Active Power', col='red')
dev.off() 
