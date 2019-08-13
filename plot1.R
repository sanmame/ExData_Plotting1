#load data
raw_data <- read.delim("household_power_consumption.txt", 
                       header = TRUE, 
                       sep = ";", 
                       dec = ".",
                       na.strings = "?", 
                       stringsAsFactors=FALSE)

#subset data from 2007-02-01 and 2007-02-02
data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

#convert Date and Time to Date/Time class
data$Date <- as.Date(data$Date, format = "dd/mm/yyyy")
data$Time <- strptime(data$Time, "%H:%M:%S")

#open png file
png("plot1.png", width = 480, height = 480)

#draw the plot
hist(data$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     col="red", 
     main = "Global Active Power",
     xlim=c(0,6),
     ylim = c(0,1200))

#close png file
dev.off()

