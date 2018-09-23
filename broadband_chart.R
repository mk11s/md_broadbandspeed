install.packages("ggplot2")
library(ggplot2)

install.packages("ggthemes")
library(ggthemes)


speed <- read_csv("Maryland_Broadband_Speed_Test__County_Upload.csv")

head(speed)

speed_mbps <- round(speed$Ave_Upload/1000,2)

ggplot(data = speed, aes(x=C0_NAME, y=Ave_Upload)) +
  geom_bar(stat="identity") +
  coord_flip()

#reorder the y axis

install.packages("forcats")

library(forcats)

ggplot(speed,
       aes(x=fct_reorder(C0_NAME, Ave_Upload, desc=TRUE), y=Ave_Upload)) +
  geom_bar(stat="identity")+
  coord_flip()+
  labs(x="MD County", y="Average Upload Speed (mbps)", 
       title = "Average Broadband Upload Speeds (mbps) in Maryland by County",
       subtitle = "for R for Journalists class",
       caption = "Data from geodata.md.gov") +
  theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_blank(),
        axis.text.x = element_blank())+
  theme_economist() +
  scale_colour_economist()

