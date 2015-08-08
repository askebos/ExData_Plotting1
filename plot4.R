#Read the data
household <- read.table('household_power_consumption.txt',sep=";", header=TRUE, stringsAsFactors = FALSE)

#Date and time formatting
household$Date <- as.Date(strptime(household$Date, format ="%d/%m/%Y"))
household$Time <- strptime(household$Time, format = "%H:%M:%S")

#Extract data from 2007-02-01 to 2007-02-02
household <- household[c(which(household$Date == '2007-02-01'), which(household$Date == '2007-02-02')),]

#Create PNG for plot
png(filename="plot4.png", width = 480, height = 480)

#Contruct plots, add x-axis, and legend
par(mfcol=c(2,2))
plot(as.numeric(household$Global_active_power), type="l",xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
axis(1, at = c(0, 1441, 2881), labels = c('Thu', 'Fri', 'Sat'))


plot(as.numeric(household$Sub_metering_1), type="l",xaxt="n", ylab="Enery sub metering", xlab="")
axis(1, at = c(0, 1441, 2881), labels = c('Thu', 'Fri', 'Sat'))
lines(as.numeric(household$Sub_metering_2), type="l", col="red")
lines(as.numeric(household$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red","blue"), bty = "n")

plot(as.numeric(household$Voltage), type="l",xaxt="n", ylab="Voltage", xlab="datetime")
axis(1, at = c(0, 1441, 2881), labels = c('Thu', 'Fri', 'Sat'))

plot(as.numeric(household$Global_reactive_power), type="l",xaxt="n", ylab="Global_reactive_power", xlab="datetime")
axis(1, at = c(0, 1441, 2881), labels = c('Thu', 'Fri', 'Sat'))


#Save plot as PNG
dev.off()

