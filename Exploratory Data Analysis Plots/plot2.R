NEI <- readRDS("summarySCC_PM25.rds")

bcdata <- subset(NEI, fips == "24510")

bcdata1 <- tapply(bcdata$Emissions, bcdata$year, sum)

barplot(bcdata1, las = 1)
title(main = "Total Annual Emissions of PM25 in Baltimore",
      xlab = "Year",
      ylab = "Total PM25 Emissions (tons)")

dev.copy(png,file ="plot2.png", width = 480, height = 480)
dev.off()
