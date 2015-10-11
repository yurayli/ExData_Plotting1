# Import the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Retrieve the dataset for only 2007-2-1 and 2007-2-2
manip <- subset(dat, Date == "01/02/2007" | Date == "02/02/2007")
# Retrieve the subset "Global Active Power"
gap <- as.numeric(levels(manip$Global_active_power))[manip$Global_active_power]
# Draw the graph
num <- length(gap)
plot(1:num, gap, type = "l", xaxt = "n", xlab = " ", 
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))

