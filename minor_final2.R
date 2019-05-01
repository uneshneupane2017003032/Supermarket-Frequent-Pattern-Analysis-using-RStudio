# Load the libraries
library(arules)
library(arulesViz)
library(datasets)

# Load the data set
data(Groceries)

itemFrequencyPlot(Groceries,topN=20,type="absolute")

# Get the rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])

Capture 1.PNG

# Shows a brief summary of the data
summary(rules)

# Sorting the data based on confidence
rules<-sort(rules, by="confidence", decreasing=TRUE)

# Applying Apriori based on user-defined support and confidence
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8,maxlen=3))

# Applying Apriori to establish relation with "Whole Milk" in Right Hand Side
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

# Applying Apriori to establish relation with "Whole Milk" in Left Hand Side
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

# Arules Visualizing Library
library(arulesViz)

# Plot visualization
plot(rules,method="graph",interactive=TRUE,shading=NA)
