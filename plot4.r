
rm(list = ls())

# COMMON FUNCTIONS
source("w1.r")

# READING CSV ETC
w1_init()

hh_pc <- w1_read_subset_file(s_file_name)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

#1)
plot(hh_pc$DateTime, hh_pc$Global_active_power, type='l',  col="black", main="",  ylab = "Global Active Power (kilowatts)", xlab="datetime")

#2)
plot(hh_pc$DateTime, hh_pc$Voltage, type='l',  col="black", main="",  ylab = "Voltage", xlab="datetime")

#3)
plot(hh_pc$DateTime, hh_pc$Sub_metering_1, type='l',  col="black", main="",  ylab = "Energy sub metering", xlab="datetime")
lines(hh_pc$DateTime, hh_pc$Sub_metering_2, type='l',  col="red", main="",  ylab = "Energy sub metering", xlab="")
lines(hh_pc$DateTime, hh_pc$Sub_metering_3, type='l',  col="blue", main="",  ylab = "Energy sub metering", xlab="")
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))



#4)
plot(hh_pc$DateTime, hh_pc$Global_reactive_power, col="black", type="l", main="", xlab="datetime",  ylab = "Global_reactive_power")

print("plot4.png ready...")

dev.off()