###Lists and Matrices

#Lists: A list is a list of "things". These can have a mixture of datatypes


list_example<-list(1,"a",TRUE, "hello",12.34,-12.54,1+1i)
list_example
#the double [[]] tells us it is a list

second_list<- list(title= "Numbers", numbers = 1:10, data = TRUE)
?list
second_list
# we just gave the elements of the list headers; can use the dollar signs to refer to elements in the list

#What "type" is a list?
typeof(second_list)
typeof(second_list$title)
typeof(second_list$data)

print(second_list$numbers)
print(second_list$numbers[3])

#Matrices
#Last but not least is the matrix. We can declare a matrix full of zeros:
#A zero filled matrix with 6 columns and 3 rows
matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example

#And similar to other data structures, we can ask things about our matrix:

class(matrix_example)

typeof(matrix_example)
str(matrix_example)

dim(matrix_example)
nrow(matrix_example)
ncol(matrix_example)

#Challenge 4

#What do you think will be the result of length(matrix_example)? Try it. Were you right? Why / why not?
length(matrix_example)
3*6
#Because a matrix is a vector with added dimension attributes,
#length gives you the total number of elements in the matrix.
###Matrices

#Last but not least is the matrix. We can declare a matrix full of zeros:

matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example

#And similar to other data structures, we can ask things about our matrix:

class(matrix_example)

typeof(matrix_example)
str(matrix_example)

dim(matrix_example)
nrow(matrix_example)
ncol(matrix_example)

#Challenge 4
#What do you think will be the result of length(matrix_example)? Try it. Were you right? Why / why not?
length(matrix_example)
3*6
#Because a matrix is a vector with added dimension attributes,
#length gives you the total number of elements in the matrix.


#Challenge 5
#Make another matrix, this time containing the numbers 1:50, with 5 columns and 10 rows.
#Did the matrix function fill your matrix by column, or by row, as its default behaviour? 
#See if you can figure out how to change this. (hint: read the documentation for matrix!)
?matrix
matrix(1:50)
matrix(1:50,10,5)
x <- matrix(1:50, ncol=5, nrow=10, byrow = TRUE) # to fill by row
x


#Challenge 6
#Create a list of length two containing a character vector for each of the sections in this part of the workshop:
##Data types
##Data structures
#Populate each character vector with the names of the data types and data structures we’ve seen so far.
dataTypes <- c('double', 'complex', 'integer', 'character', 'logical')
dataStructures <- c('data.frame', 'vector', 'factor', 'list', 'matrix')
answer <- list(Types = dataTypes, Structures = dataStructures)
answer
#Note: it’s nice to make a list in big writing on the board or taped to the wall listing all of these types and structures
#- leave it up for the rest of the workshop to remind people of the importance of these basics.


#Challenge7
#Consider the R output of the matrix below:
  [,1] [,2]
[1,]    4    1
[2,]    9    5
[3,]   10    7
#What was the correct command used to write this matrix? Examine each command and try to figure out the correct one before typing them. Think about what matrices the other commands will produce.
matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)
matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)
matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)
matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)
#the last one


