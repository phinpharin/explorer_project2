
## 1. Have total emissions from PM 2.5 decreased in the United States from 1999 to 2008? Using the base
## plotting system, make a plot showing the total PM 2.5 emission from all sources for each of the years
## 1999, 2002, 2005, and 2008.

## Read data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## from 1999 to 2008 there are only  years 1999 , 2002, 2005,2008
table(NEI$year)

##so  we can calculate entirely 
total <- aggregate(Emissions ~ year, NEI, sum)

## and seeing
print(total)

##ploting
png('plot1.png')
barplot(height=total$Emissions, names.arg=total$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions from 1999 to 2008'),col="red")
dev.off()