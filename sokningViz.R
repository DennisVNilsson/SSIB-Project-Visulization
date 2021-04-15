#Import tidyverse, ggplot2 relevant
library(tidyverse)
library("gridExtra")
library("cowplot")

#Creating data frame for sorting method
dfsokningAlla<- data.frame(ElementTyp = c("Element A", "Element A", "Element A", "Element A",
                                   "Element B", "Element B", "Element B", "Element B",
                                   "Icke-existerande element C", "Icke-existerande element C", 
                                   "Icke-existerande element C", "Icke-existerande element C"), 
                       Class = c( "ArrayList", "LinkedList", "Stack", "SLL",
                                  "ArrayList", "LinkedList", "Stack", "SLL",
                                  "ArrayList", "LinkedList", "Stack", "SLL"),
                       Mean = c(486.12, 515.66, 556.86, 432.21,
                                6810.12, 6480.85, 6579.81, 6466.13, 
                                13860.57, 8241.44, 13120.05, 8185.66), 
                       ConfidenceInterval = c( 36.3941, 192.3234, 163.5568, 161.9461,
                                               540.694, 179.112, 180.488, 254.263,
                                               329.99, 212.103, 406.74, 245.835))
dfsokningAlla$Class = as.factor(dfsokningAlla$Class) # Set class as factor variable
head(dfsokningAlla) # Show the data frame



##Plot

# Standard deviation of the mean as error bar
sokningAlla <- ggplot(dfsokningAlla, aes(x=Class, y=Mean, fill=ElementTyp)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=Mean-(ConfidenceInterval/2), ymax=Mean+(ConfidenceInterval/2)), width=.5,
                position=position_dodge(.9))

# Change color by groups
# Add error bars
sokningAlla <- sokningAlla + labs(title="Medelvärde för sökning beroende av klass och elementposition", 
                                                    subtitle = "Konfidensintervall representerat med respektive intervall" ,x="Klass", y = "Medelvärde (ns)") + 
  scale_fill_brewer(palette="Greens") + theme_minimal()

sokningAlla
#plot_grid(sp, bp, labels=c("A", "B"), ncol = 2, nrow = 1)
