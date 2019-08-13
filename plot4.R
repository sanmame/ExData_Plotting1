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
png("plot4.png", width = 480, height = 480)

#divide space
par(mfrow=c(2,2))

#draw the plots
  #first plot
  plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab = "",
     ylab = "Global Active Power")
  #second plot
  plot(data$DateTime, data$Voltage,
       type="l")
  #third plot
  plot(data$DateTime, data$Sub_metering_1,
       type="l",
       xlab = "",
       ylab = "Energy sub metering")
  lines(data$DateTime, data$Sub_metering_2, col="red")
  lines(data$DateTime, data$Sub_metering_3, col="blue")
  legend("topright", 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         lty = 1, 
         col = c("black", "red", "blue"))
  #fourth plot
  plot(data$DateTime, data$Global_reactive_power, 
       type = 'l')

#close png file
dev.off()