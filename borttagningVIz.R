#Import tidyverse, ggplot2 relevant
library(tidyverse)
library("gridExtra")
library("cowplot")

#Creating data frame for sorting method
borttagningALLA<- data.frame(ElementPlats = c("Första elementet", "Första elementet", 
                                            "Första elementet", "Första elementet",
                                          "Mellerst elementet", "Mellerst elementet",
                                          "Mellerst elementet", "Mellerst elementet",
                                          "Sista elementet", "Sista elementet",
                                          "Sista elementet", "Sista elementet"), 
                           Class = c( "ArrayList", "LinkedList", "Stack", "SLL",
                                      "ArrayList", "LinkedList", "Stack", "SLL",
                                      "ArrayList", "LinkedList", "Stack", "SLL"),
                           Mean = c(86555.15, 559.11, 76001.95, 546.73,
                                    86287.01, 1230.21, 81187.49, 3324.77,
                                    91896.76, 2062.29, 82575.40, 5419.74), 
                           ConfidenceInterval = c(2574.98, 77.5973, 2397.4, 192.2615, 
                                                  1993.16, 125.294, 5218.48, 749.73,
                                                  8776.03, 232.957, 3480.27, 867.591))
borttagningALLA$Class = as.factor(borttagningALLA$Class) # Set class as factor variable
head(borttagningALLA) # Show the data frame

#######################################################################################

#Creating data frame for ArrayList and Stack
borttagningArrayStack<- data.frame(ElementPlats = c("Första elementet", "Första elementet",
                                              "Mellerst elementet", "Mellerst elementet",
                                              "Sista elementet", "Sista elementet"), 
                             Class = c( "ArrayList",  "Stack", 
                                        "ArrayList",  "Stack", 
                                        "ArrayList",  "Stack"),
                             Mean = c(86.55515,  76.00195, 
                                      86.28701,  81.18749, 
                                      91.89676,  82.57540), 
                             ConfidenceInterval = c(2.57498,  2.3974, 
                                                    1.99316, 5.21848, 
                                                    8.77603, 3.48027))
borttagningArrayStack$Class = as.factor(borttagningArrayStack$Class) # Set class as factor variable
head(borttagningArrayStack) # Show the data frame

################################################################################

#Creating data frame for SingleLinkedList and LinkedList
borttagningSingleLL<- data.frame(ElementPlats = c("Första elementet", "Första elementet",
                                                  "Mellerst elementet", "Mellerst elementet",
                                                  "Sista elementet", "Sista elementet"), 
                             Class = c(  "LinkedList",  "SLL",
                                         "LinkedList",  "SLL",
                                         "LinkedList",  "SLL"),
                             Mean = c(559.11, 546.73,
                                      1230.21, 3324.77,
                                      2062.29, 5419.74), 
                             ConfidenceInterval = c(77.5973, 192.2615, 
                                                    125.294, 749.73,
                                                    232.957, 867.591))
borttagningSingleLL$Class = as.factor(borttagningSingleLL$Class) # Set class as factor variable
head(borttagningSingleLL) # Show the data frame

################################################################################

#Creating data frame for sorting method
borttagningPOPSTACK<- data.frame(ElementPlats = c("Första elementet"), 
                             Class = c("Stack"),
                             Mean = c(1002.511), 
                             ConfidenceInterval = c(420.0685))
borttagningPOPSTACK$Class = as.factor(borttagningPOPSTACK$Class) # Set class as factor variable
head(borttagningPOPSTACK) # Show the data frame

################################################################################


##Plot

# Standard deviation of the mean as error bar
borttagningPLOTStackPop <- ggplot(borttagningPOPSTACK, aes(x=Class, y=Mean, fill=ElementPlats)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=Mean-(ConfidenceInterval/2), ymax=Mean+(ConfidenceInterval/2)), width=.5,
                position=position_dodge(.9))

# Change color by groups
# Add error bars
borttagningPLOTStackPop <- borttagningPLOTStackPop + labs(title="Medelvärde för borttagning för klassen stack med metoden pop()", 
                                  subtitle = "Konfidensintervall representerat med respektive intervall" ,x="Klass", y = "Medelvärde (ns)") + 
  scale_fill_brewer(palette="Greens") + theme_minimal()

borttagningPLOTStackPop
#plot_grid(sp, bp, labels=c("A", "B"), ncol = 2, nrow = 1)
