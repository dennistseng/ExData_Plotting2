library(ggplot2)

Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")

class1 <- grep("coal",Source_Classification_Code$EI.Sector,value=T,ignore.case=T)
class2 <- subset(Source_Classification_Code, Source_Classification_Code$EI.Sector %in% class1, select = SCC)
filter <- subset(PM25, PM25 %in% class2$SCC)
total <- aggregate(Emissions ~ year, PM25, sum)

png('plot4.png')

p <- ggplot(total, aes(x=year, y=Emissions)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Total PM2.5 Coal Combustion Emissions in the US")
print(p)

dev.off()
