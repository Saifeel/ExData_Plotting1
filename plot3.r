setwd("~/Desktop/datasciencecoursera/Plotting project 1")

main1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    stringsAsFactors = FALSE,dec = ".", na.strings = "?")
main2 <- subset(main1, main1$Date == "1/2/2007")
main3 <- subset(main1, main1$Date == "2/2/2007")
main <- rbind(main2, main3)

datetime <- strptime(paste(main$Date, main$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
meter1 <- as.numeric(main$Sub_metering_1)
meter2 <- as.numeric(main$Sub_metering_2)
meter3 <- as.numeric(main$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, meter1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, meter2, type = "l", col = "red")
lines(datetime, meter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()