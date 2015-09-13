##  Name: plot1.R
##  Purpose: plots an histogram of the "power consumption" csv file for Feb 1-2, 2007
##           The input data for this comes from 
##             "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##
##  Output:  This will produce a file "plot1.png", a histogram chart of power consumption for Feb 1-2, 2007

## set the working directory and download the file, and unzip it.

  setwd("C:/users/gvsha/Documents/coursera/4Exp_DAnalysis")

  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")
  dateDownloaded <- date()

  unzip("exdata_data_household_power_consumption.zip")

## Read the csv file, fields separated by ;
##   then split the file for the dates needed (Feb 1-2, 2007), 
##     and extract the Global_active_power column, this will be the y value in the chart
##
##   set the "png" file to plot the graph instead of the screen
##   Plot the histogram chart of the y variable
##   close the device

  pwr_mstr <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".", fill = TRUE)

  pwr1 <- subset(pwr_mstr, Date == "1/2/2007" | Date == "2/2/2007", select = Global_active_power)

  png("plot1.png", width=480, height=480)
  hist(as.numeric(as.character(pwr1$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
  dev.off()

# End of plot1.R
