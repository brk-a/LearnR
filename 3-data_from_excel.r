#!/usr/bin/env Rscript

##############################################################
#                                                            #
#                    Working with .xls*                      #
#                                                            #
##############################################################

#How to get data from excel into R --------------------------

#check if library `readxl` is loaded
search()

# if the name `readxl` does not appear in output, check if
# said pkg is installed
library()

#if yes, very good; all set. if  not, install it
install.packages("readxl", dependencies=T)

#there may be an error when installing; to catch it, do this
if (!require(readxl)) install.packages('readxl')
library(readxl)

#import the data required
friends <- read_excel("Data/friends.xlsx", sheet="position",
	range= "C4:G14", na="**")
	#assumes `**` reps missing values in the spreadsheet
# the `sheet` arg: that is the name of the sheet. Could also
# use the sheet number. In this case, it is sheet 3. As such,
# `sheet=3` works as well

# Bonus: library(pkg) vs require(pkg) --------------------------
# Short version: If you use library(pkg) and pkg has not been
# installed, your program will stop and throw an error with a
# message. If you use require(pkg), you will get a warning, not
# an error. Your program will carry on, only to crash later when
# you use a function from the library `pkg`.
# Two, require calls library. This suggests that it is more
# efficient to use library
