library(ggplot2)

Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")
filter <- subset(PM25, fips == '24510'|fips == '06037') 

class1 <- grep("vehicle",Source_Classification_Code$EI.Sector,value=T,ignore.case=T)
class2 <- subset(Source_Classification_Code, Source_Classification_Code$EI.Sector %in% class1, select = SCC)
filter2 <- subset(filter, filter$SCC %in% class2$SCC)
total <- aggregate(Emissions ~ year * fips, filter2, sum)
total$city <- rep(NA, nrow(total))
total[total$fips == "06037", ][, "city"] <- "LA"
total[total$fips == "24510", ][, "city"] <- "Baltimore"

png('plot6.png')

plot <- ggplot(total, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(stat="identity", position=position_dodge()) +
  ggtitle("Vehicle Emissions - Baltimore vs LA")
print(plot)

dev.off()
