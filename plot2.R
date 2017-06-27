setwd("C:/Users/r624461/Desktop/Data Science/Exploratory Data Analysis")

#Read in the full data set
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Subset the data for plotting
data <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#Modify the date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


#Plot the subsetted data as a histogram
with(data, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})

#Save the plot to a PNG file and close the connection!
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()