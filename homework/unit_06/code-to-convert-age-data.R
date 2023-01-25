## ----load packages and set options, include=FALSE------------------------------------------------------------------------------------------
library(tidyverse) 
library(magrittr)
library(knitr)
library(patchwork)
library(ggplot2)
library(dplyr)
library(nortest)
library(splitstackshape)
library(haven)
library(nhstplot)
library(gplots)
library(kableExtra)
#library(wesanderson)

theme_set(theme_bw())
options(tinytex.verbose = TRUE)


## ------------------------------------------------------------------------------------------------------------------------------------------
# the raw data was donwloaded from the source saved as csv file. 

d1<-read_csv('state_charactor.csv')

d1 <- d1 %>% select("NAME", "DP05_0001E", "DP05_0005E", "DP05_0006E","DP05_0007E", "DP05_0008E","DP05_0009E", "DP05_0010E", "DP05_0019E" )

d1 = d1[-1,]
d1 = d1[-52,]

d1 <- d1 %>% 
  rename(
    state = NAME, 
    total = DP05_0001E ,
    age5less = DP05_0005E,
    age5to9 = DP05_0006E,
    age10to14 = DP05_0007E,
    age15to19 = DP05_0008E,
    age20to24 = DP05_0009E,
    age25to34 = DP05_0010E,
    age18less = DP05_0019E
     )

write.csv(d1, "d1.csv")



## ------------------------------------------------------------------------------------------------------------------------------------------

d2<-read_csv('d2.csv')
d2$age18to34 <- d2$age5less + d2$age5to9 + d2$age10to14 +  d2$age15to19 + d2$age20to24 +d2$age25to34 -d2$age18less 
d2$age18to34_percentage <- d2$age18to34 / d2$total  
d2$age18to34_percentage <- format(round(d2$age18to34_percentage, 2), nsmall = 2)
d3 <- d2 %>% select("state", "age18to34", "age18to34_percentage" ) 
summary(d3)
write.csv(d3, "d3.csv")


