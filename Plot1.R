Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")

transform(PM25$year, as.factor(PM25$year))
plot(PM25$year, PM25$Emissions)

