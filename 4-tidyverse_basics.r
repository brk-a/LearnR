#!/usr/bin/env Rscript

###############################################################
#                                                             #
#                    Basics of `tidyverse`                    #
#                                                             #
###############################################################

#pkg tidyverse is a coherent system of packages for data manipulation,
#exploration and visualisation that share a common design philosophy

#use a data-set that is built into tidyverse; the star wars data-set
# use `data()` to see the data-sets that  are available in R

if (!require(tidyverse)) install.packages("tidyverse", dependencies=T)
library(tidyverse)

View(starwars)

starwars %>%
	 select(height, mass, gender, species) %>%
	 filter(species == "Human") %>%
	 na.omit() %>%
	 mutate(height /= 100) %>%
	 mutate(BMI = mass / height^2) %>%
	 group_by(gender) %>%
	 summarise(Average_BMI = mean(BMI))

sw_0 <- starwars %>%
   select(name, height, mass, gender, everything()) %>%
   rename(weight = mass) %>%
   na.omit() %>%
   mutate(height /= 100) %>%
   mutate(BMI = weight / weight^2) %>%
   groupby(gender) %>%
   summarise(Average_BMI = mean(BMI))

sw_1 <- starwars %>%
     select(name, height, mass, gender) %>%
     na.omit() %>%
     mutate(height /= 100) %>%
     filter(gender %in% c("male", "female")) %>%
     mutate(gender = recode(gender, male = "m", female = "f")) %>%
     mutate(size = height > 1 & mass > 75, if_else(
     		 size, "big", "small")) %>%
	mutate(BMI = mass / height^2) %>%
	groupby(gender) %>%
	summarise(Average_BMI = mean(BMI))
