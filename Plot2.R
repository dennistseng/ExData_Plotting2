Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")

filter <- subset(PM25, fips == '24510')
total <- aggregate(Emissions ~ year, filter, sum)

png("plot2.png")
barplot(total$Emissions,names.arg = total$year, xlab = "year", ylab="Emissions", main="Total Emissions in Baltimore City")
dev.off()