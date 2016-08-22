Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")

total <- aggregate(Emissions ~ year, PM25, sum)

png("plot1.png")
barplot(total$Emissions, names.arg = total$year, xlab = "year", ylab="Emissions", main="Total Emissions")
dev.off()