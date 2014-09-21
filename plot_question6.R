##6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
##sources in Los Angeles County, California ( fips == "06037" ). Which city has seen greater changes
##over time in motor vehicle emissions?

## Read data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## from 1999 to 2008 there are only  years 1999 , 2002, 2005,2008
table(NEI$year)



# Geting  Baltimore emissions and  Los Angeles emissions from motor vehicle sources
baltimore <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
angeles <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]

## calculate total emissions by year
total_baltimore <- aggregate(Emissions ~ year, baltimore, sum)
total_angeles <- aggregate(Emissions ~ year, angeles,sum)

## and if we add names for city
total_baltimore$Name <- "Baltimore City, MD"
total_angeles$Name <- "Los Angeles County, CA"

## finally
total <- rbind(total_baltimore, total_angeles)

##ploting
library(ggplot2)
png("plot6.png")
ggplot(total, aes(x=factor(year), y=Emissions, fill=Name)) +
  geom_bar(stat="identity") +
  facet_grid(Name ~ ., scales="free") +
  ylab(expression("total PM"[2.5]*" emissions (ton)")) +
  xlab("year") +
  ggtitle("Comparaison motor vehicle emission in\n Baltimore and Los Angeles")
dev.off()