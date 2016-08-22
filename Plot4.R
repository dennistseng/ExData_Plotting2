library(ggplot2)

Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")

class1 <- grep("coal",Source_Classification_Code$EI.Sector,value=T,ignore.case=T)
class2 <- subset(Source_Classification_Code, Source_Classification_Code$EI.Sector %in% class1, select = SCC)
filter <- subset(PM25, PM25$SCC %in% class2$SCC)
total <- aggregate(Emissions ~ year, filter, sum)

png('plot4.png')

plot <- ggplot(total, aes(x=factor(year), y=Emissions)) +
  geom_bar(colour="black", stat="identity") +
  ggtitle("Total Coal Emissions in the US")
print(plot)

dev.off()
