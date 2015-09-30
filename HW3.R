
#Set WD, For Mac, Load Data
setwd("/Users/Craig/Documents/CS_480")
load("allcancers.RData")

#Install Relevant Packages
install.packages("ggplot2")
install.packages("shiny")
install.packages("googleVis")

#Use libraries
library(ggplot2)
library(shiny)
library(googleVis)

#Lets get the coloumn names
names(cancer)

#ggplot2
#Get rid of outliers
survival <- data.frame(cancer$surv[cancer$surv < 9999], cancer$sex[cancer$surv < 9999])

#rename columns 
colnames(survival)[1] = "survival"
colnames(survival)[2] = "sex"

#plot
ggplot(survival, aes(x = survival, group = sex, colour = sex)) + geom_density(adjust = 0.25)

#googleVis
#Find all unique states
unique(unlist(cancer$reg))
state = unique(unlist(cancer$reg))
elements = vector(mode = "numeric", length = length(state))
states <- data.frame(state, elements)

#Get amount per state
states$elements[states$state == "CT"] = length(cancer$reg[cancer$reg == "CT"])
states$elements[states$state == "dM"] = length(cancer$reg[cancer$reg == "dM"])
states$elements[states$state == "HI"] = length(cancer$reg[cancer$reg == "HI"])
states$elements[states$state == "IA"] = length(cancer$reg[cancer$reg == "IA"])
states$elements[states$state == "NM"] = length(cancer$reg[cancer$reg == "NM"])
states$elements[states$state == "sf"] = length(cancer$reg[cancer$reg == "sf"])
states$elements[states$state == "UT"] = length(cancer$reg[cancer$reg == "UT"])
states$elements[states$state == "sW"] = length(cancer$reg[cancer$reg == "sW"])
states$elements[states$state == "aG"] = length(cancer$reg[cancer$reg == "aG"])
states$elements[states$state == "rG"] = length(cancer$reg[cancer$reg == "rG"])
states$elements[states$state == "AK"] = length(cancer$reg[cancer$reg == "AK"])
states$elements[states$state == "la"] = length(cancer$reg[cancer$reg == "la"])
states$elements[states$state == "sj"] = length(cancer$reg[cancer$reg == "sj"])
states$elements[states$state == "NJ"] = length(cancer$reg[cancer$reg == "NJ"])
states$elements[states$state == "CA"] = length(cancer$reg[cancer$reg == "CA"])
states$elements[states$state == "KY"] = length(cancer$reg[cancer$reg == "KY"])
states$elements[states$state == "LA"] = length(cancer$reg[cancer$reg == "LA"])
states$elements[states$state == "GA"] = length(cancer$reg[cancer$reg == "GA"])

#plot
us_map <- gvisGeoChart(states, "state", "elements", options = list(region = "US", displayMode = "regions", resolution = "provinces"))
plot(us_map)




