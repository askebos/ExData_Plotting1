#Read the data
household <- read.table('household_power_consumption.txt',sep=";", header=TRUE, stringsAsFactors = FALSE)

#Date and time formatting
household$Date <- as.Date(strptime(household$Date, format ="%d/%m/%Y"))
household$Time <- strptime(household$Time, format = "%H:%M:%S")

#Extract data from 2007-02-01 to 2007-02-02
household <- household[c(which(household$Date == '2007-02-01'), which(household$Date == '2007-02-02')),]

#Create PNG for plot
png(filename="plot1.png", width = 480, height = 480)

#Contruct histogram
hist(as.numeric(household$Global_active_power), col ="red", main=  "Global Active Power",xlab = "Global Active Power (kilowatts)")

#Save plot as PNG
dev.off()

