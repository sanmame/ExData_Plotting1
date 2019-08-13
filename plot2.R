#load data
raw_data <- read.delim("household_power_consumption.txt", 
                       header = TRUE, 
                       sep = ";", 
                       dec = ".",
                       na.strings = "?", 
                       stringsAsFactors=FALSE)

#subset data from 2007-02-01 and 2007-02-02
data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

#make a new column with Date + Time converted to Date/Time class
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#open png file
png("plot2.png", width = 480, height = 480)

#draw the plot
plot(data$DateTime, data$Global_active_power, 
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)") 

#close png file
dev.off()
