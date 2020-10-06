###########################################################################
######################      R for Env Sci - Week 03    ####################
######################         01_basic_concepts       ####################
###########################################################################

## Let's start with a black slate - Let's re-start the R session
# CAREFUL!!! do it at your own risk!

# Ctrl + Shift + Fn + F10  (PC / Linux)
# Command + Shift + Fn+ F10 (Mac OS)


# Objects and how to assign them -------------------------------------------

a <- 4

print(a)

a


# Right assignment. 
# Less common, it can be convenient, but hard to locate in the code

5 -> b

b

# You can assign with an "="

c = 3

c


# all the same... but try to avoid using "=". 
# Incompatibilities with other languages (e.g. C) and problems with certain functions

## quick note!

a

a == 3

a != 3

# == and != are questions, =, <-, -> are orders


# R is a fancy calculator -------------------------------------------------


2+1

2*1

2/2

2^2

a + b

20^(1/2)


# Functions ---------------------------------------------------------------

# If you need to do something more than 3 times, consider making it a function!

a^(1/2)

sqrt(a)


(a + b + c) / 3 

mean(a,b,c)

## nesting functions. The "Russian doll"

mean(a,b,c)

sqrt(mean(a,b,c))

exp(sqrt(mean(a,b,c)))

round(exp(sqrt(mean(a,b,c))))


## This can make code VERY Convoluted, and is one of the main
## reasons why R can seem "Scary" to newcomers.
## Worry not, thanks to the tidyverse, there is a better way.
## stay tunned!



# Packages ----------------------------------------------------------------


# packages are groups of functions that are created for a specific purpose
# They can contain data used to run examples of how to use the package

# e.g. the {stats} package

?stats

?median()


# Good package practice is to write them mostly in base R
# if they, themselves, need other packages (dependencies)
# then they are vulnerable to those other packages not being mantained/updated
# now... some packages (i.e. Tidyverse family) should be safe enough
# (they ensure backwards compatibility)

# still, try to not over-use packages.

