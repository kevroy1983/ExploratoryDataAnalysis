NEI <- readRDS("summarySCC_PM25.rds")

bctype <- subset(NEI, fips == "24510")

library(dplyr)
bctype <- bcdata %>% 
      group_by(year, type) %>% 
      summarise(annualtotals = sum(Emissions),
                n = n()) %>% 
      arrange(year, type)

ggplot(bctype, aes(factor(year), annualtotals, fill = type)) +
      geom_bar(stat = "identity") +
      facet_grid(.~type) +
      labs(title = "Annual PM25 Pollutants by Source Type") +
      xlab("Year") +
      ylab("Total PM25 Emissions (tons)") +
      theme(legend.position = "none")

dev.copy(png,file ="plot3.png", width = 480, height = 480)
dev.off()
