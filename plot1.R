##  Name: plot1.R
##  Purpose: plots an histogram of the "power consumption" csv file for the dates
##             Feb 1, 2007 and Feb 2, 2007

setwd("C:/users/gvsha/Documents/coursera/4Exp_DAnalysis")

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")
dateDownloaded <- date()

unzip("exdata_data_household_power_consumption.zip")

pwr_mstr <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".", fill = TRUE)

pwr1 <- subset(pwr_mstr, Date == "1/2/2007" | Date == "2/2/2007", select = Global_active_power)

png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(pwr1$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()

