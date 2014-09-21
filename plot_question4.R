#4. Across the United States, how have emissions from coal combustion-related sources changed from
##1999–2008?

## Read data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## from 1999 to 2008 there are only  years 1999 , 2002, 2005,2008
table(NEI$year)

##if coal combustion-related sources in SCC
isCoal<-grepl("*coal",SCC$EI.Sector,ignore.case = T)

##get those
data_yes<-SCC[isCoal,]

data<-NEI[(NEI$SCC %in% data_yes$SCC),]

##so  we can calculate entirely 
total <- aggregate(Emissions ~ year  , data, sum)

## and seeing
print(total)

##ploting

library(ggplot2)
png("plot4.png")
ggplot(total, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("emissions from coal combustion-related sources changed from
1999–2008?")
dev.off()