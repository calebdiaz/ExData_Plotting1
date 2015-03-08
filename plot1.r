
rm(list = ls())

# COMMON FUNCTIONS
source("w1.r")

# READING CSV ETC
w1_init()

hh_pc <- w1_read_subset_file(s_file_name)

png("plot1.png", width=480, height=480)

hist(hh_pc$Global_active_power, col="red", main="Global Active Power",  xlab = "Global Active Power (kilowatts)")

print("plot1.png ready...")

dev.off()
