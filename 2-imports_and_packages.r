#!/usr/bin/env Rscript

###################################################################
#                                                                 #
#                       Imports and Packages                      #
#                                                                 #
###################################################################

# 2 objectives: import data into R and install + load packages in R
# Load is R for `import` in py  or `#include` in C

# same dataframe as 1-core_data_types.r ----------------------------

friends <- read.csv("Data/friends.csv")

#first 6 rows
head(friends)

#last 6 rows
tail(friends)

#data in spread-sheet format
View(friends)

#rows are observations, columns are variables ---------------------

#obs 1 or var 3
friends[1,3]

#all obs of var 2
friends[,2]

#all vars of obs 2
friends[2,]

#all obs of var `height`
friends$height

#install and load packages ----------------------------------------

#packages are pre-programmed functions that solve specific problems
# and expand the R vocabulary

#install a package (always install relevant dependencies)
#eg. pkg `tidyverse`
install.packages("tidyverse", dependencies=T)

#install more than one pkg at a time
install.packages(c("meme", "wordcloud", "SnowBallC"), dependencies=T)

#load the package
# 2 ways: library("pkg_name") and require("pkg_name")
# use one or the other, not both at the same time

library("tidyverse")

#Bonus - the pipe operator `%>%` ------------------------------------

# Pipe operator in R looks like this: %>%
# so, cat file.csv | tr '' ... would be: cat file.csv %>% tr ''...
# simply, output of LHS is input of RHS; same as bash
# possible to chain pipes; see example below
# think of %>% as R for '...and then...'

friends %>%
	select(Name, Age, Height) %>%
	filter(Age > 23 & Height == "Medium") %>%
	arrange(Height)
