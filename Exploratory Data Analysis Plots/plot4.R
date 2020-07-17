SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

mrg <- merge(SCC, NEI, by = "SCC")

coaldata <- mrg[grep("[Cc]oal", mrg$EI.Sector),]

coaldata1 <- tapply(coaldata$Emissions, coaldata$year, sum)

options(scipen = 5)
par(mar = c(5,5,4,2))
barplot(coaldata1, las= 1, cex.axis = 0.7, cex.names = 0.9)
title(main = "Annual PM25 from coal combustion-related sources",
      xlab = "Year",
      ylab = "PM25 per ton")

dev.copy(png,file ="plot4.png", width = 480, height = 480)
dev.off()
