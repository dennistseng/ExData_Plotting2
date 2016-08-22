library(ggplot2)

Source_Classification_Code <- readRDS("Source_Classification_Code.rds")
PM25 <- readRDS("summarySCC_PM25.rds")

filter <- subset(PM25, fips == '24510')

total <- aggregate(Emissions ~ year * type, filter, sum)

png("plot3.png")

plot <- ggplot(total, aes(x=year,y=Emissions,color=type)) + 
                 geom_line(size=1) +
                 ggtitle("Total Emissions by Type in Baltimore")
               
print(plot)

dev.off()
