## IMPORT household_power_consumption.txt
import <- read.csv(file.choose(), header = TRUE, dec=".", skip=0, sep=";", na.strings = "?")
import$Date <- as.Date(import$Date,"%d/%m/%Y")

# SUBSET ON DATE FROM THE DATES 2007-02-01 AND 2007-02-02
import_subset <- subset(import, Date >= "2007-02-01" & Date <= "2007-02-02")

# CREATE PLOT1 AND SAVE TO PNG FILE
png("plot1.png",width=480,height=480 ,res=100)
hist(import_subset$Global_active_power, xlab="Global Active Power (kilowats)", main="Global Active Power", col="red")
dev.off()