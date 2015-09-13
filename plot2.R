## IMPORT household_power_consumption.txt
import <- read.csv(file.choose(), header = TRUE, dec=".", skip=0, sep=";", na.strings = "?")
import$Date <- as.Date(import$Date,"%d/%m/%Y")

# SUBSET ON DATE FROM THE DATES 2007-02-01 AND 2007-02-02
import_subset <- subset(import, Date >= "2007-02-01" & Date <= "2007-02-02")
import_subset$DateTime <- as.POSIXct(paste(import_subset$Date,import_subset$Time),tz="UCT")

# CREATE PLOT2 AND SAVE TO PNG FILE
Sys.setlocale("LC_TIME", "C")
png("plot2.png",width=480,height=480 ,res=100)
par(cex.lab = 0.63, cex.axis = 0.7)
plot(import_subset$DateTime, import_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()