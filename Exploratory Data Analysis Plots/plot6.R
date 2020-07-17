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

vehdata3 <- subset(vehdata, fips == "06037" )
vehdata4 <- vehdata3 %>% 
      group_by(year) %>% 
      summarise(lavehiclepm25 = sum(Emissions)) %>% 
      arrange(year)

mrg2 <- merge(vehdata2, vehdata4, by = "year")

library(ggplot2)
library(gridExtra)
p1 <- ggplot(mrg2, aes(factor(year), lavehiclepm25) ) +
      geom_bar(stat = "identity", fill = "purple") +
      labs(title = "Motor Vehicle Emissions' in Los Angeles City") +
      xlab(NULL) +
      ylab("Total PM25 Emissions (Tons)")
p2 <- ggplot(mrg2, aes(factor(year), bcvehiclepm25) ) +
      geom_bar(stat = "identity", fill = "red") +
      labs(title = "Motor Vehicle Emissions' in Baltimore City") +
      xlab("Year") +
      ylab("Total PM25 Emissions (Tons)") +
      theme(legend.position = "right")
grid.arrange(p1,p2, ncol = 1)

dev.copy(png,file ="plot6.png", width = 480, height = 480)
dev.off()
