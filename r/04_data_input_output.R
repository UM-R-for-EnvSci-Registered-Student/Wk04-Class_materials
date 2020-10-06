###########################################################################
######################      R for Env Sci - Week 03    ####################
###################           04_Data_input_output        #################
###########################################################################

## Let's start with a black slate - Let's re-start the R session   <- CAREFUL!!! do it at your own risk!

# Ctrl + Shift + Fn + F10  (PC / Linux)
# Command + Shift + Fn+ F10 (Mac OS)


# Let's make some mock-up data --------------------------------------------


mock_df <- data.frame(sample_id = seq(from = 900, to = 999, by = 1),                      # sequence of 100 numbers from 900 - 999
                  param_a = rnorm(100, 0.5, 0.05),                                    # 100 random numbers from a normal distribution with a mean = 0.5 and an sd = 0.05
                  param_b = sample(c(TRUE, FALSE), 100, replace = TRUE),              # sample 100 elements from a "hat" with balls labeled "TRUE" or "FALSE". Put the balls back
                  param_c = sample(c("Present", "Absent"), 100, replace = TRUE))      # sample 100 elements from a "hat" with balls labeled "Present" or "Absent". Put the balls back

mock_df

head(mock_df)
tail(mock_df)


# save the data ----------------------------------------------------------


write.csv(mock_df, "data/example_data_set_a.csv",  # Relative path starting at our project folder. Convenient! and works for everyone!
          row.names = FALSE)  # "row.names = FALSE" prevents it from creating a new column of row names


write.table(mock_df, file = "data/example_data_set_b.txt", sep = "\t")  

# write.table does automatically create a row.names column, 
# in fact, it messes up the column names if you ask it to avoid it
# very not intuitive!


# read data ---------------------------------------------------------------


data_a <- read.csv("data/example_data_set_a.csv")

data_a

head(data_a)

str(data_a)
attributes(data_a)
colnames(data_a)
rownames(data_a)

summary(data_a)


data_b <- read.table("data/example_data_set_b.txt") 

head(data_b)

str(data_b)
attributes(data_b)
colnames(data_b)
rownames(data_b)



### NOTE: The Tidyverse has their own versions of read and write functions that are a bit more user friendly
### and intuitive, we will use these in the future

