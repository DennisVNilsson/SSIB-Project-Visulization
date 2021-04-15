#Import tidyverse, ggplot2 relevant
library(tidyverse)
library("gridExtra")
library("cowplot")

#Creating data frame for sorting method
dfInsättningALLA<- data.frame(Class = c( "ArrayList", "LinkedList", "Stack", "SLL"),
                           Mean = c(56393.34600, 155.91500, 56564.62000, 30.44115), 
                           ConfidenceInterval = c( 440.867, 2.602, 308.737, .90113))
dfInsättningALLA$Class = as.factor(dfInsättningALLA$Class) # Set class as factor variable
head(dfInsättningALLA) # Show the data frame

#ArrayList and Stack ##########
OthersDf<- data.frame(Class = c( "ArrayList", "Stack"),
                              Mean = c(56393.34600, 56564.62000), 
                              ConfidenceInterval = c( 440.867, 308.737))
OthersDf$Class = as.factor(OthersDf$Class) # Set class as factor variable
head(OthersDf) # Show the data frame

# LinkedList and SLL ############
LinkedLists<- data.frame(Class = c(  "LinkedList", "SLL"),
                              Mean = c( 155.91500, 30.44115), 
                              ConfidenceInterval = c( 2.602, .90113))
LinkedLists$Class = as.factor(LinkedLists$Class) # Set class as factor variable
head(LinkedLists) # Show the data frame


##Plot

# Standard deviation of the mean as error bar
insättningUnLinked <- ggplot(OthersDf, aes(x=Class, y=Mean, fill = Class)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=Mean-(ConfidenceInterval/2), ymax=Mean+(ConfidenceInterval/2)), width=.5,
                position=position_dodge(.9))

# Change color by groups
# Add error bars
insättningLinked <- insättningLinked + labs(title="Medelvärde för insättninng av klasser med länkad datastruktur", 
                                  subtitle = "Konfidensintervall representerat med respektive intervall" ,x="Klass", y = "Medelvärde (ms)") + 
  scale_fill_brewer(palette="Greens") + theme_minimal()

insättningUnLinked
#plot_grid(sp, bp, labels=c("A", "B"), ncol = 2, nrow = 1)
