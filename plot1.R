# Import the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Retrieve the dataset for only 2007-2-1 and 2007-2-2
manip <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# Retrieve the subset "Global Active Power"
gap <- as.numeric(levels(manip$Global_active_power))[manip$Global_active_power]

# Draw the graph
hist(gap, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

