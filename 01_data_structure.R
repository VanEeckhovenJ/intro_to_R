# Author: Jens Van Eeckhoven
# Date: 10 January 2018
# Purpose: Script to create and analyse data frames

# read the data file from disk
cats <- read.csv(file = "data/feline-data.csv",header = TRUE)

cats

#Address a particular column with $
cats$weight
cats$coat


#Add 2 kg to each weigth
cats$weight+2

#Data types
typeof(cats$weight)
# "double" = real numbers
typeof(cats$coat)
#"integer"; recognises them as categories, and replaces with integers (i.e. level 1, 2, 3, ...) in the background

class(cats)


#Vectors
my_vector<-vector(length = 3)
#placeholder vector, is empty for now
my_vector


my_vector <- vector(mode="character",length = 3)
my_vector

#Make a vector
combine_vector<- c(2,4,"eight")
combine_vector

char_vector<-c("2","4","8")
char_vector
num_vector<-as.numeric(char_vector)
num_vector


#Challenge 1
#Start by making a vector with the numbers 1 through 26.
#Multiply the vector by 2, and give the resulting vector names A through Z (hint: there is a built in vector called LETTERS)

challenge1<- c(1:26)
challenge1<- challenge1*2
challenge1
letters

names(challenge1)<-LETTERS
challenge1
# each cell has received an identifying letter


#Factors and levels
coats<-c("tabby","tortoiseshell","tortoiseshell", "black","tabby")
coats
#structure:
str(coats)

categories <- factor(coats)
class(categories)
str(categories)
typeof(categories)





