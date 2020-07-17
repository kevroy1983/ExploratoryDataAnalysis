NEI <- readRDS("summarySCC_PM25.rds")

totemissions <- tapply(NEI$Emissions, NEI$year, sum)

options(scipen = 5)
barplot(totemissions, cex.axis = 0.8)
title(main = "Total Annual Emissions of PM25 in the United States",
      xlab = "Year", 
      ylab = "Total PM25 Emissions (Tons)")

dev.copy(png,file ="plot1.png", width = 480, height = 480)
dev.off()

# Total annual emmisions of PM2.5 have reduced greatly between 1999 and 2008, where it reduced to more than half the amount in 2008
