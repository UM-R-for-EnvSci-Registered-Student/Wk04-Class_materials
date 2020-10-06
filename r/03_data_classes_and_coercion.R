###########################################################################
######################      R for Env Sci - Week 03    ####################
###################      03_Data_classes_and_coercion     #################
###########################################################################

## Let's start with a black slate - Let's re-start the R session
## CAREFUL!!! do it at your own risk!

# Ctrl + Shift + Fn + F10  (PC / Linux)
# Command + Shift + Fn + F10 (Mac OS)


# Data classes do not mix ------------------------------------------------

a <- 3
a

gene <- "Gene X"
gene

gene * a # try to multiply, it doesn't work -> Key term "non-numeric"

class(a)        # a is a number
class(gene)     # gene is a string of characters



# Coercion ----------------------------------------------------------------

# What happens when you do try to mix them??


# let's make two vectors, one numeric, one of characters:


numbers_vct <- c(1,2,3,4)

characters_vct <- c("#2", "two", "2nd", "2")

# let's look at them

numbers_vct
characters_vct

# now let's try to convert between classes and see what happens


as.character(numbers_vct)

# If we try to make the numeric vector "numbers" into characters. 
# It works! because numbers are ALSO strings!


characters_vct

as.numeric(characters_vct) 

# If we try to turn "characters" into numeric.
# That doesn't quite work... what happened??
# R tries! it does it best... but some things just can't be...



# Because numbers are also characters, when in doubt, R will default to making everything characters.

c(1,2,3,"a", "b", "c")


# This is very important to keep in mind!

# Interesting cases:

c(1, 2, 3, "NR", 4, 5, 6)  #Perfectly good vectors of numbers with one missing, recoded as "NR"


c(1, 2, 3, NA, 4, 5, 6) # That's why it is HIGHLY recommended to use NA for missing values



# white spaces in excel

c(1, 2, "3 ", 4) # if you have checked everything and it is still telling you its text... check for spaces



# work with colleagues in continental Europe? Watch for commas as decimal separators

c("2,50", "4,50")




# Factors - A special type ------------------------------------------------


## Factors are important for categorical variables (e.g. treatments)

numbers_vct

class(numbers_vct)

characters_vct

class(characters_vct)


## Let's turn them into factors

as.factor(numbers_vct)        # Turn our numeric vector into factor. Look similar, but new "levels" section

as.factor(characters_vct)     # Turn our character vector into factors



# Lets create a new vector which is made of factors from the start

factors_vct <- factor(c(10,10,10,20,20,20))

length(factors_vct)

factors_vct

levels(factors_vct)


# you can have factors that don't appear in any sample

factors_vct <- factor(c(10,10,10,20,20,20), levels = c("10", "20", "30"))


# important for legends for example, where you want to show that the data could have had another value,
# but that value didn't show up in any of the samples



# What would happen if i try to turn this vector into a numeric or a character??

as.character(factors_vct)              
# Ok, that seems to work

as.numeric(factors_vct)                  
# That does not quite work! 
# the actual factors are stored separately as factors names while the vector has the factor levels, 
# it provides the factor level. KEEP IN MIND!


# If you want to retrieve the actual values and convert them to numeric, you need an extra step:

as.character(factors_vct)

as.numeric(as.character(factors_vct))




# Can i add elements to a factors vector?

factors_vct

length(factors_vct)

factors_vct[7] <- 30

factors_vct

factors_vct[8] <- 40 # this doesn't work, because "40" is not an available level yet

factors_vct

# The factor level needs to exist in advance

factors_vct <- factor(factors_vct, levels = c("10", "20", "30", "40"))

factors_vct

factors_vct[8] <- 40 # this doesn't work, because "40" is not an available level yet

factors_vct

