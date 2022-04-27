#!/usr/bin/env Rscript

####################
# Core data types  #
###################

# 5 core types: chr, int, num, factor, logical

# 1: chr is, simply, character; that is, string/text
# 2: int is whole numbers (discrete, in stats terms)
# 3: num is the R equivalent of float (continuous, in stats terms)
# 4: factor is chr, but with order; that is, ordinal data type
# 5: logi is the R way of saying bool

#assume a dataframe called friends. 4 columns: name (chr), height (chr),
#age (num) and weight (num); types inferred by R by default

#structure of the df
str(friends) #Jesus fvkn christ! Why'd they have to use `str`?

#height (short, medium, tall) is ordinal dat, therefore, factor is
#appropriate. Age is better off as int
friends$height <- as.factor(friends$height)
friends$age <- as.integer(friends$age)
str(friends)

#height, as stated is a categorical, ordinal variable
#variable is R's word for column names.
#to show the categories, do this...
levels(friends$height)

#categories are listed in alphabetical order by default
# to change that, do this...
friends$height <- factor(friends$height, levels = c("Short", "Medium", "Tall"))
levels(friends$height)

#create a column whose fields are FALSE if age <= 23, TRUE otherwise
friends$old <- friends$age > 23
str(friends)
class(friends$old) # R's way of showing type
