library(ggplot2)
e3<-read.csv('e3.csv', header=TRUE)
ggplot(e3, aes(x = highpoint_metres, y = oxygen_used))+
  + geom_point()+
  + stat_density2d()
