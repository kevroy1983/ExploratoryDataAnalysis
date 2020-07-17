SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

mrg <- merge(SCC, NEI, by = "SCC")

vehdata <- mrg[grep("[Vv][Ee][Hh]", mrg$Short.Name),]

vehdata1 <- subset(vehdata, fips == "24510")

library(dplyr)
vehdata2 <- vehdata1 %>% 
      group_by(year) %>% 
      summarise(bcvehiclepm25 = sum(Emissions)) %>% 
      arrange(year)

vehdata2$year <- as.factor(vehdata2$year)

library(ggplot2)
ggplot(aes(year, bcvehiclepm25), data = vehdata2) +
      geom_bar(stat = "identity", fill = "red") +
      labs(title = "Emissions from Motor Vehicle in Baltimore City") +
      xlab("Year") +
      ylab("Total PM25 Emissions (Tons)")

dev.copy(png,file ="plot5.png", width = 480, height = 480)
dev.off()
