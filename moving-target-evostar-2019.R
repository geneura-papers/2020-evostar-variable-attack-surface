## ----setup, cache=FALSE,echo=FALSE--------------------------------------------
library(ggplot2)
library(ggthemes)
data <- read.csv("results/all_results.csv")


## ----results-time,cache=FALSE,echo=FALSE--------------------------------------
ggplot(data,aes(x=Population,y=Days,color=Web)) + geom_tufteboxplot()+ theme_tufte()
ggsave("duration.png",width=12,height=8)

ggplot(data,aes(x=Population,y=Copies,color=Web)) + geom_point()+geom_jitter()+ theme_tufte()
ggsave("copies.png",width=12,height=8)


## ----results-static,cache=FALSE,echo=FALSE------------------------------------
 data$Crossover <- as.factor(data$Crossover)
data$Population <- as.factor(data$Population)
data.web <- data[data$Web == "Static",]
ggplot(data.web, aes(x=Population,y=Fitness,color=Crossover,shape=Mutation, size=Copies*10,alpha=Days)) + geom_jitter(width = 0.3, height=0)+ theme_tufte()
ggsave("crossover-mutation.png",width=12,height=8)


## ----results-juice-shop,cache=FALSE,echo=FALSE--------------------------------
data.juice <- data[data$Web == "Juice Shop",]

ggplot(data.juice, aes(x=Population,y=Fitness,color=Crossover,shape=Mutation, size=Copies*10,alpha=Days))+ geom_jitter(width = 0.3,height=0) +  theme_tufte()
ggsave("crossover-mutation-juice-shop.png",width=12,height=8)
