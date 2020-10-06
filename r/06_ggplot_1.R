###########################################################################
######################      R for Env Sci - Week 03    ####################
###################                06_ggplot              #################
###########################################################################

## Let's start with a black slate - Let's re-start the R session   <- CAREFUL!!! do it at your own risk!

# Ctrl + Shift + Fn + F10  (PC / Linux)
# Command + Shift + Fn+ F10 (Mac OS)


# Load required packages --------------------------------------------------

library(tidyverse)
library(janitor)


# Data input 1 ------------------------------------------------------------


ditch_data_original <- read_delim("data/ditch.txt", delim = "\t")


# Data manipulation -------------------------------------------------------


ditch_data <- ditch_data_original %>% 
  clean_names() %>% 
  rename(ph = p_h)


glimpse(ditch_data)


# lets look at the data ---------------------------------------------------


ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity), colour = "red")


## Difference between things inside and outside of the aesthetics

ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity, colour = site))


# Continuous vs factors

ditch_data

ditch_data <- ditch_data %>% 
  mutate(site = as.factor(site))

ditch_data

ditch_data$site


# lets plott it again

ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity, colour = site))



# is there a trend??

ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity, colour = site)) +
  geom_smooth(aes(x = year, y = conductivity))


ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity, colour = site)) +
  geom_smooth(aes(x = year, y = conductivity), method = "lm")


ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity, colour = site)) +
  geom_smooth(aes(x = year, y = conductivity, colour = site), method = "lm", se = FALSE)



# Lets pivot and see what we can do --------------------------------------


ditch_data_long <- ditch_data %>% 
  pivot_longer(cols = c(-site, -month, -year, -depth), 
               names_to = "parameter", 
               values_to = "measure", )



ditch_data_long %>% 
  ggplot() +
  facet_wrap(~parameter) +
  geom_point(aes(x = year, y = measure))


## The scales are quite different, hard to see.. let's fix that!

ditch_data_long %>% 
  ggplot() +
  facet_wrap(~parameter, scales = "free") +
  geom_point(aes(x = year, y = measure))


ditch_data_long %>% 
  ggplot() +
  facet_wrap(~parameter, scales = "free") +
  geom_point(aes(x = year, y = measure)) +
  geom_smooth(aes(x = year, y = measure), method = "lm", se = FALSE)


ditch_data_long %>% 
  ggplot() +
  facet_wrap(~parameter, scales = "free") +
  geom_point(aes(x = year, y = measure, colour = site)) +
  geom_smooth(aes(x = year, y = measure, colour = site), method = "lm", se = FALSE)



# save plots --------------------------------------------------------------


conductivity_plot <- ditch_data %>% 
  ggplot() +
  geom_point(aes(x = year, y = conductivity, colour = site)) +
  geom_smooth(aes(x = year, y = conductivity, colour = site), method = "lm", se = FALSE)


ggsave("figures/conductivity_plot.pdf", conductivity_plot,
       width = 190, height = 120, units = "mm")

