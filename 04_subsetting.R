#Subsetting data


#R has many powerful subset operators.
#Mastering them will allow you to easily perform complex operations on any kind of dataset.
#There are six different ways we can subset any kind of object,
#and three different subsetting operators for the different data structures.

#Let’s start with the workhorse of R: a simple numeric vector.
x <- c(5.4, 6.2, 7.0, 4.1, 8.3)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x
#Atomic vectors
#In R, simple vectors containing character strings, numbers, or logical values are called atomic vectors
#because they can’t be further simplified.
#So now that we’ve created a dummy vector to play with, how do we get at its contents?

#Refer to elements
x[1]
x[3]
x[c(1,4)]
x[1:4]

#Skipping/removing elements
x[-2]
x[c(-1,-3)]

#Using names
x["a"]
x[c("b","d")]


#Challenge 1

#Given the following code:
  
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

#Come up with at least 3 different commands that will produce the following output:
  b   c   d 
6.2 7.1 4.8 
#After you find 3 different commands, compare notes with your neighbour. Did you have different strategies?
x[c("b","c","d")]
x[2:4]
x[-c(1,5)]
x[c(2,3,4)]






