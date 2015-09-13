## IMPORT household_power_consumption.txt
import <- read.csv(file.choose(), header = TRUE, dec=".", skip=0, sep=";", na.strings = "?")
import$Date <- as.Date(import$Date,"%d/%m/%Y")

# SUBSET ON DATE FROM THE DATES 2007-02-01 AND 2007-02-02
import_subset <- subset(import, Date >= "2007-02-01" & Date <= "2007-02-02")
import_subset$DateTime <- as.POSIXct(paste(import_subset$Date,import_subset$Time),tz="UCT")

# CREATE PLOT4 AND SAVE TO PNG FILE
Sys.setlocale("LC_TIME", "C")
png("plot4.png",width=480,height=480 ,res=100)
par(mfrow = c(2, 2), cex.axis = 0.8, cex.lab = 0.8, mar = c(5, 4, 1, 1))

plot(import_subset$DateTime, import_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(import_subset$DateTime, import_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(import_subset$DateTime, import_subset$Sub_metering_1, type="l", col= 1, xlab="", ylab="Energy sub metering")
lines(import_subset$DateTime, import_subset$Sub_metering_2, col = 2)
lines(import_subset$DateTime, import_subset$Sub_metering_3, col = 4)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1,2,4), lty = 1, bty = "n", ,
       cex = 0.67)

plot(import_subset$DateTime, import_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()