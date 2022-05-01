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

#### ------- 1. pipe operator `%>%` and select()  -----------------

starwars %>%
	 select(height, mass, gender, species) %>%
	 filter(species == "Human") %>%
	 na.omit() %>%
	 mutate(height /= 100) %>%
	 mutate(BMI = mass / height^2) %>%
	 group_by(gender) %>%
	 summarise(Average_BMI = mean(BMI))

#### ------- 2. everything() ---------------------------------------

sw_0 <- starwars %>%
   select(name, height, mass, gender, everything()) %>%
   rename(weight = mass) %>%
   na.omit() %>%
   mutate(height /= 100) %>%
   mutate(BMI = weight / weight^2) %>%
   groupby(gender) %>%
   summarise(Average_BMI = mean(BMI))

#### ------- 3. recode() and if_else() -----------------------------

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

#### 4. subset using filter() --------------------------------------

#use the data-set `msleep`

View(msleep)

ms_0 <- msleep %>%
     select(name, sleep_total) %>%
     filter(sleep_total > 18)

ms_1 <- msleep %>%
     select(name, sleep_total) %>%
     filter(!sleep_total > 18)

ms_2 <- msleep %>%
     select(name, order, bodywt, sleep_total) %>%
     filter(order == "Primates", bodywt > 20)

ms_3 <- msleep %>%
     select(name, order, bodywt, sleep_total) %>%
     filter(order == "Primates" | bodywt > 20)

ms_4 <- msleep %>%
    select(name, sleep_total) %>%
    filter(name == "Goat" | name == "Cow" |
    name == "Dog")

ms_5 <- msleep %>%
    select(name, sleep_total) %>%
    filter(name %in% c("Goat", "Cow", "Dog"))

ms_6 <- msleep %>%
    select(name, sleep_total) %>%
    filter(between(sleep_total, 16, 18))

ms_7 <- msleep %>%
    select(name, sleep_total) %>%
    filter(near(sleep_total, 17, tol = 0.5))

ms_8 <- msleep %>%
    select(name, conservation, sleep_total) %>%
    filter(is.na(conservation))

ms_9 <- msleep %>%
    select(name, conservation, sleep_total) %>%
    filter(!is.na(conservation))
