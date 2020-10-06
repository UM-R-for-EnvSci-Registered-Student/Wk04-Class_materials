###########################################################################
######################      R for Env Sci - Week 03    ####################
######################      02_objec_and_data_types    ####################
###########################################################################

## Let's start with a black slate - Let's re-start the R session
# CAREFUL!!! do it at your own risk!

# Ctrl + Shift + Fn + F10  (PC / Linux)
# Command + Shift + Fn+ F10 (Mac OS)



# Vectors -----------------------------------------------------------------


test_vect <- c(11, 23, 45, 63, 84)

test_vect


test_vect[3]     # call the 3rd item of test_vect


test_vect[3] * test_vect[4]    # multiply the 3rd and 4th items of test_vect


mean(test_vect)  # you can apply functions to vectors.


length(test_vect)   # check the "length" of the vector (number of elements)


# you can take elements out

test_vect

test_vect <- test_vect[-2]  # removing an element (in this case the second one)

test_vect

length(test_vect)


# You can put elements in

test_vect <- c(test_vect, 22, 98, 35, 76)

test_vect

length(test_vect)


# class and other info

is.vector(test_vect)

str(test_vect)


## Attributes

## Attributes are information attached to an object other than the data itself

attributes(test_vect)

test_vect

names(test_vect)

names(test_vect) <- c("a", "b", "c", "d", "e", "f", "g", "h")

test_vect

attributes(test_vect)

names(test_vect)



# Matrices ----------------------------------------------------------------


test_mat <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)

test_mat  # by default they get filled downwards!

# but You can ask it to fill-in row-wise

matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2, byrow = TRUE) 


dim(test_mat)   # check the dimensions  (ROWS first and COLUMNS second)

str(test_mat)   # You can check the structure of the matrix (what data type)


## dimensions need to "fit" your data

matrix(1:5, nrow = 3, ncol = 3)  

# it doesn't work, because the length of the vector doesn't match the dimensions


# you can make a matrix from a pre-existing vector by modifying the attributes


test_vect_2 <- c(seq(1:8))

test_vect_2

attributes(test_vect_2)

dim(test_vect_2) <- c(2,4)

test_vect_2

attributes(test_vect_2)


# accessing elements

test_mat[1,2] 

# on two dimensional objects, ROWS first and COLUMNS second. e.g. [ROW, COLUMN] 
# Like playing battleship!

test_mat[2,1]

test_mat[1,]  # you can call a whole row

test_mat[,1]  # you can call a whole column



# attributes and names

str(test_mat)

attributes(test_mat) # check the attributes of the matrix

colnames(test_mat) <- c("col_a", "col_b")
rownames(test_mat) <- c("row_1", "row_2", "row_3")

attributes(test_mat) # check the attributes of the matrix

test_mat

test_mat["row_1", "col_a"]

test_mat["row_1",]  
# You still need to add the comma and the empty space for the other coordinate

test_mat[,"col_a"]  
# You still need to add the comma and the empty space for the other coordinate




### NOTE: Matrices are used quite a bit for multivariate statistics (e.g. PCA).
## So it is worth familiarizing yourself with how to use them
### Tidy approaches to incorporate data frames in these analysis are coming up




# Data frames -------------------------------------------------------------

# the most useful. Similar to named matrices,
# but it allow for different types of data in the same objects!! :D




test_df <- data.frame(var_1 = c(1, 2, 3, 4, 5, 6),
                      var_2 = c(7, 8, 9, 10, 11, 12),
                      var_3 = c("a", "b", "c", "d", "e", "f"),
                      var_3 = c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE))  

# you can specify the variable names right here!!

test_df

dim(test_df)  # you can also check the dimensions of your df

str(test_df)  # In a data frame you can have multiple types of data

attributes(test_df)


# in a data frame, columns (variables) and rows are named from the beginning

colnames(test_df)

rownames(test_df)   

# row names are only marginally useful
# you are better off creating a column of IDs if you want that info



## "extracting" and calling specific elements


test_df$var_1   # There is a unique way of calling one variable (column) in df


# but you can do it just like for matrices

test_df[,1]          

# Equivalent to what we did before in matrix, 
# but much easier to call things by their name 
# (as long as you kept it short and neat!)

test_df[,"var_1"]    # The "$var_1" approach is still simpler 


# I do recommend the "$var_1" approach. 
# Among other reasons, because it simplifies getting specific objects

test_df$var_1[2] # call the second element (vertically) of a variable

# vs

test_df[,"var_1"][2]  # this is a bit more cumbersome


# you can call by "position" like in matrices


test_df[1,2] 


### NOTE: Tibbles, the Tidyverse version of a dataframe exist 
### They are (generally) better.
### We will see these soon. Stay tunned!




# Lists -------------------------------------------------------------------
# The most flexible class
# The output from most stats (ANOVAs, Lm, PCAs, etc) is a list.
# Knowing how to "dig" through them, will help you make better use of outputs

# They can contain other objects, each, of their oun class!


# Let's make a list containing all the previous obgects we have created

test_list <- list(test_vect, test_mat, test_df)


test_list[[1]] # call the first element of the list (test_vect)

test_list[1]   # Need the [[]]. 

# If you call it wit [] it access the first element, 
# but the new object is still a list, harder to handle
# for further manipulation


str(test_list[[1]])
str(test_list[1])


# You can call individual "pieces" within the fustian doll

test_list
test_list[[3]]
test_list[[3]]$var_3 # cal a variable in the third element of the list (test_df)
test_list[[3]]$var_3[3] # third element on third variable of third object




### a bit of cleaning

rm(test_vect_2)

