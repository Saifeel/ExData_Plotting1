setwd("~/Desktop/datasciencecoursera/Plotting project 1")

main1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    stringsAsFactors = FALSE,dec = ".", na.strings = "?")
main2 <- subset(main1, main1$Date == "1/2/2007")
main3 <- subset(main1, main1$Date == "2/2/2007")
main <- rbind(main2, main3)

datetime <- strptime(paste(main$Date, main$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactive <- as.numeric(main$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalactive, col = "red", main = "Global Active Power", 
xlab = "Global Active Power (kilowatts)")

dev.off()