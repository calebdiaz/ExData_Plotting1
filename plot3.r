
rm(list = ls())

# COMMON FUNCTIONS
source("w1.r")

# READING CSV ETC
w1_init()

hh_pc <- w1_read_subset_file(s_file_name)

png("plot3.png", width=480, height=480)

plot(hh_pc$DateTime, hh_pc$Sub_metering_1, type='l',  col="black", main="",  ylab = "Energy sub metering", xlab="")
lines(hh_pc$DateTime, hh_pc$Sub_metering_2, type='l',  col="red", main="",  ylab = "Energy sub metering", xlab="")
lines(hh_pc$DateTime, hh_pc$Sub_metering_3, type='l',  col="blue", main="",  ylab = "Energy sub metering", xlab="")
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))

print("plot3.png ready...")

dev.off()