##5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Read data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## from 1999 to 2008 there are only  years 1999 , 2002, 2005,2008
table(NEI$year)

##there are 5 types of source
table(NEI$type)

## and ON-ROAD is motor vehicle sources
data<-NEI[NEI$fips == "24510" & NEI$type=="ON-ROAD",]

##so  we can calculate entirely 

total <- aggregate(Emissions ~ year  , data, sum)

## and seeing
print(total)

##ploting

library(ggplot2)
png("plot5.png")
ggplot(total, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("motor vehicle sources changed from 1999–2008 in Baltimore City?")
dev.off()