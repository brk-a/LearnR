#!/usr/bin/env Rscript

#############################################################################################
#                                                                                           #
#                           Functions and Objects: The Basics                               #
#                                                                                           #
#############################################################################################

#Use dataframe `cars`

#View(cars)

#### ------- 1. object; object everywhere --------------------------------------------------

num_1 <- 17
num_2 <- 59

num_1
num_2

#### ------- 2. functions -------------------------------------------------------------------

sum(num_1, num_2)

tot <- sum(num_1, num_2)
tot

cat(num_1,"+",num_2,"equals",tot,"\n")

plot(cars)

hist(cars$speed)
attach(cars)
hist(dist) #attach() removes the need to use `cars$dist`

summary(cars)
summary(speed)
summary(dist)

#summarise(cars)

class(cars)
class(speed)
class(dist)

length(speed)
length(dist)

unique(speed)
unique(dist)

head(cars)
tail(cars)

ca_0 <- cars[3:6, 1:2]
