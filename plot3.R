# Import the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Retrieve the dataset for only 2007-2-1 and 2007-2-2
manip <- subset(dat, Date == "01/02/2007" | Date == "02/02/2007")

# Retrieve the subsets "Sub_metering1, 2, 3"
sm1 <- as.numeric(levels(manip$Sub_metering_1))[manip$Sub_metering_1]
sm2 <- as.numeric(levels(manip$Sub_metering_2))[manip$Sub_metering_2]
sm3 <- manip$Sub_metering_3

# Draw the plot
num <- length(sm1)
plot(1:num, sm1, type = "l", xaxt = "n", xlab = " ", 
     ylab = "Energy sub metering")
lines(1:num, sm2, type = "l", xaxt = "n", col = "red")
lines(1:num, sm3, type = "l", xaxt = "n", col = "blue")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
legend('topright', # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend
       lty = 1, # gives the legend appropriate symbols (lines)
       col = c("black","red","blue"), # gives the legend lines the correct color
       cex = 0.75, text.width = 800) # modifies the text size
