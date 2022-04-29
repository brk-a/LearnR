#!/usr/bin/env Rscript

###############################################################
#                                                             #
#                    Basics of `tidyverse`                    #
#                                                             #
###############################################################

#pkg tidyverse is a coherent system of packages for data manipulation,
#exploration and visualisation that share a common design philosophy

#use a data-set that is built into R; the star wars data-set
# use `data()` to see the data-sets that  are available

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
