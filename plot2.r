
rm(list = ls())

# COMMON FUNCTIONS
source("w1.r")

# READING CSV ETC
w1_init()

hh_pc <- w1_read_subset_file(s_file_name)

png("plot2.png", width=480, height=480)

plot(hh_pc$DateTime, hh_pc$Global_active_power, type='l',  col="black", main="",  ylab = "Global Active Power (kilowatts)", xlab="")

print("plot2.png ready...")

dev.off()