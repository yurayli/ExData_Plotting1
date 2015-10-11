# 4 figures arranged in 2 rows and 2 columns
par(mfrow = c(2,2))

# Import the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Retrieve the dataset for only 2007-2-1 and 2007-2-2
manip <- subset(dat, Date == "01/02/2007" | Date == "02/02/2007")
# Retrieve the subsets "Sub_metering1, 2, 3"
gap <- as.numeric(levels(manip$Global_active_power))[manip$Global_active_power]
grp <- as.numeric(levels(manip$Global_reactive_power))[manip$Global_reactive_power]
V <- as.numeric(levels(manip$Voltage))[manip$Voltage]
sm1 <- as.numeric(levels(manip$Sub_metering_1))[manip$Sub_metering_1]
sm2 <- as.numeric(levels(manip$Sub_metering_2))[manip$Sub_metering_2]
sm3 <- manip$Sub_metering_3

## Draw the graph
num <- length(gap)
# plot 1
plot(1:num, gap, type = "l", xaxt = "n", xlab = " ", 
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
# plot 2
plot(1:num, V, type = "l", xaxt = "n", xlab = "datetime", 
     ylab = "Voltage")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
# plot 3
plot(1:num, sm1, type = "l", xaxt = "n", xlab = " ", 
     ylab = "Energy sub metering")
lines(1:num, sm2, type = "l", xaxt = "n", xlab = " ", col = "red")
lines(1:num, sm3, type = "l", xaxt = "n", xlab = " ", col = "blue")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col = c("black","red","blue"), bty = 'n', 
       cex=.35, pt.cex = 1, text.width = 800)
# plot 4
plot(1:num, grp, type = "l", xaxt = "n", xlab = "datetime", 
     ylab = "Global_reactive_power")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
