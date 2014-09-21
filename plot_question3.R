## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which
##of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which
##have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
##answer this question.

## Read data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## from 1999 to 2008 there are only  years 1999 , 2002, 2005,2008
table(NEI$year)

##data of the Baltimore City, Maryland ( fips == "24510" )
data_24510<-subset(NEI,fips=="24510")

##so  we can calculate entirely 

total <- aggregate(Emissions ~ year + type , data_24510, sum)

## and seeing
print(total)

##ploting


library(ggplot2)
png('plot3.png')
ggplot(total, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("PM"[2.5]*" emissions")) +
  ggtitle(expression("PM"[2.5]* "emissions from 1999–2008 for Baltimore City"))
dev.off()