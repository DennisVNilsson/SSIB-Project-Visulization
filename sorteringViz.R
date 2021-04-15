#Import tidyverse, ggplot2 relevant
library(tidyverse)

# To combine images 
install.packages("gridExtra")
library("gridExtra")
install.packages("cowplot")
library("cowplot")

#Creating data frame for sorting method with biggest staple
dfOnlySLL<- data.frame(DataTyp = c("Slumpad", "Delvis sorterad", 
                                   "Delvis sorterad", "Delvis sorterad"), 
                       Class = c( "SLL", "SLL"),
                       Mean = c(4349403.00, 4304008.00), 
                       ConfidenceInterval = c( 11616, 12511))
df1$Class = as.factor(df1$Class) # Set class as factor variable
head(df1) # Show the data frame
 
#####################################################################


#Creating data frame for sorting method 
df1sorted<- data.frame(DataTyp = c("Slumpad", "Slumpad", "Slumpad", "Slumpad",
                             "Delvis sorterad", "Delvis sorterad", 
                             "Delvis sorterad", "Delvis sorterad"), 
                Class = c( "ArrayList", "LinkedList", "Stack", "SLL",
                           "ArrayList", "LinkedList", "Stack", "SLL"),
                Mean = c(188.34310, 170.83280, 181.46190, 4349.40300, 
                         74.64109, 87.39144, 70.39563, 4304.00800), 
                ConfidenceInterval = c(6.6681, 3.2841, 4.4755, 11.616, 
                                       4.37139, 1.91194, 3.06036, 12.511))
df1$Class = as.factor(df1$Class) # Set class as factor variable
head(df1) # Show the data frame

#####################################################################

#Creating data frame for sorting method, wo/ SingleLinkedList
df2sorted<- data.frame(DataTyp = c("Slumpad", "Slumpad", "Slumpad",
                              "Delvis sorterad", "Delvis sorterad", 
                              "Delvis sorterad"), 
                 Class = c( "ArrayList", "LinkedList", "Stack",
                            "ArrayList", "LinkedList", "Stack"),
                 Mean = c(188.34310, 170.83280, 181.46190, 
                          74.64109, 87.39144, 70.39563), 
                 ConfidenceInterval = c(6.6681, 3.2841, 4.4755, 
                                        4.37139, 1.91194, 3.06036))
df2sorted$Class = as.factor(df2sorted$Class) # Set class as factor variable
head(df2sorted) # Show the data frame


#####################################################################

# Standard deviation of the mean as error bar
sorted <- ggplot(df1sorted, aes(x=Class, y=Mean, fill=DataTyp)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=Mean-(ConfidenceInterval/2), ymax=Mean+(ConfidenceInterval/2)), width=.5,
                position=position_dodge(.9))

# Change color by groups
# Add error bars
sorted <- sorted + labs(title="Medelvärde för sortering beroende av klass och indata", 
        subtitle = "Konfidensintervall representerat med respektive intervall" ,x="Klass", y = "Medelvärde (ms)") + 
          scale_fill_brewer(palette="Greens") + theme_minimal()

#plot_grid(sp, bp, labels=c("A", "B"), ncol = 2, nrow = 1)

