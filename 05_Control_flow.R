# Loops and if statements in R
# Jens Van Eeckhoven
# 24 january 2018

# IF statements are used to take different routes
# through a program depending on values of variables are

x <- 8

if(x>=10) {
  print("x is greater than 10")
}else{
  print("x is less than 10")
}

# else usually used as a 'catchall' at the end, as a sort of error message

# To check for multiple conditions, use else if clauses. (clauses = just bits/chunks..., as in clauses in sentences)
# cascading tests:
x<-4

if(x>=10){
  print("x is greater than or equal to 10")
}else if (x>5){
  print("x is greater than 5, less than 10")
}else{
  print("x is less than or equal to 5")
}


###################Challenge 1#############################
#Use an if() statement to print a suitable message reporting whether there are any records from 2002 in the gapminder dataset.
str(gapminder)

gapminder$year == 2002

if(gapminder$year==2002){
  print(gapminder[(gapminder$year == 2002),])
}else{
  print("No records for 2002")
}

#Now do the same for 2012.
if(gapminder$year==2012){
  print("There are records for 2012")
}else {
  print("There are no records for 2012")
}

#Did anyone get a warning message like this?:
#"Warning in if (gapminder$year == 2012) {: the condition has length > 1 and only the first element will be used"

#If your condition evaluates to a vector with more than one logical element,
#the function if() will still run, but will only evaluate the condition in the first element.
#Here you need to make sure your condition is of length 1.

#Tip: any() and all()
#The any() function will return TRUE if at least one TRUE value is found within a vector,
#otherwise it will return FALSE. This can be used in a similar way to the %in% operator.
#The function all(), as the name suggests, will only return TRUE if all values in the vector are TRUE.

gapminder$year==2002
any(gapminder$year==2002)

gapminder$year==2012
any(gapminder$year==2012)

#Solution:
#We will first see a solution to Challenge 1 which does not use the any() function.
#We first obtain a logical vector describing which element of gapminder$year is equal to 2002:
  
gapminder[(gapminder$year == 2002),]

#Then, we count the number of rows of the data.frame gapminder that correspond to the 2002:
gapminder[(gapminder$year==2002),]

rows2002_number <- nrow(gapminder[(gapminder$year == 2002),])
rows2002_number

#The presence of any record for the year 2002 is equivalent to the request that rows2002_number is one or more:
  
rows2002_number >= 1

#Putting all together, we obtain:
  
if(nrow(gapminder[(gapminder$year == 2002),]) >= 1){
 print("Record(s) for the year 2002 found.")
}else{
  print("Records for 2002 not found")
}

#All this can be done more quickly with any(). The logical condition can be expressed as:
  
if(any(gapminder$year == 2002)){
  print("Record(s) for the year 2002 found.")
}




#################Loops######################
# FOR loops repeat a fixed number of times
for (i in 1:10){
  print(i)
}

# it expects the i to be integers
# we cannot iterate over real numbers

# you don't necessarily need a set length; you can use: for (i in 1:length(vector))

#nested loops = loops inside loops
for(i in 1:5){
  for(j in c("a","b","c","d","e")){
    print(paste(i,j))                         #paste() joins together 2 strings
  }
}

#Rather than printing the results, we could write the loop output to a new object.

output_vector <- c()
for(i in 1:5){
  for(j in c('a', 'b', 'c', 'd', 'e')){
    temp_output <- paste(i, j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector

#This approach can be useful, but ‘growing your results’ (building the result object incrementally) is computationally inefficient,
#so avoid it when you are iterating through a lot of values.
#Tip: don’t grow your results
#One of the biggest things that trips up novices and experienced R users alike,
#is building a results object (vector, list, matrix, data frame) as your for loop progresses.
#Computers are very bad at handling this, so your calculations can very quickly slow to a crawl.
#It’s much better to define an empty results object before hand of the appropriate dimensions.
#So if you know the end result will be stored in a matrix like above, create an empty matrix with 5 row and 5 columns,
#then at each iteration store the results in the appropriate location.

#A better way is to define your (empty) output object before filling in the values.
#For this example, it looks more involved, but is still more efficient.

output_matrix <- matrix(nrow=5, ncol=5)
output_matrix
j_vector <- c('a', 'b', 'c', 'd', 'e')
j_vector
for(i in 1:5){
  for(j in 1:5){
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i, j] <- temp_output
  }
}
output_matrix
output_vector2 <- as.vector(output_matrix)
output_vector2



#WHILE loops repeat until some condition is met (any condition)
# it can happen that the condition is never met.... so try to avoid that (e.g. can't stop the super computer?!?)

z<-0  # it needs a seed value
      

?runif
runif(1) # 1 = sample size of uniform distribution
hist(runif(500))



while (z>0.1) {
  z<- runif(1)
  print(z)
}
#when it went into the loop... 0 is smaller than 0.1
# stopped

z<-1    # you want to get the first test to go through

while (z>0.1) {
  z<- runif(1)
  print(z)
}


#Challenge 2
output_matrix <- matrix(nrow=5, ncol=5)
output_matrix
j_vector <- c('a', 'b', 'c', 'd', 'e')
j_vector
for(i in 1:5){
  for(j in 1:5){
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i, j] <- temp_output
  }
}
output_matrix
output_vector2 <- as.vector(output_matrix)
output_vector2


#Compare the objects output_vector and output_vector2.
#e.g. are they the same???:
vec1<-c("a","b","c")
vec2<-c("a","b","c")
?all #are all of the values true
all(vec1 == vec2)

#but the order is important
vec3<-c("c","b","a")
all(vec1 == vec3)

#see whether one vector is contained within another
vec4<-c("a","b","c","d")
all(vec1 %in% vec4)
# vec4 is longer, but the question was whether vec1 was contained within vec4 
#if we do it the other way around
all(vec4 %in% vec1)

#Are they the same?
#We can check whether the two vectors are identical using the all() function:
  
  all(output_vector == output_vector2)

#However, all the elements of output_vector can be found in output_vector2:
  
  all(output_vector %in% output_vector2)

#and vice versa:
  
  all(output_vector2 %in% output_vector)

#therefore, the element in output_vector and output_vector2 are just sorted in a different order.
#This is because as.vector() outputs the elements of an input matrix going over its column.
#Taking a look at output_matrix, we can notice that we want its elements by rows.
  output_matrix
#The solution is to transpose the output_matrix.
 #We can do it either by calling the transpose function t() or by inputing the elements in the right order.
  
#e.g.
output_vector2 <- as.vector(t(output_matrix))
output_vector2
output_vector

#or e.g.:
output_matrix <- matrix(nrow=5, ncol=5)
j_vector <- c('a', 'b', 'c', 'd', 'e')
for(i in 1:5){
  for(j in 1:5){
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[j,i] <- temp_output                           #i and j switched around
  }
}
output_matrix
output_vector2 <- as.vector(output_matrix)
output_vector2

#Challenge 3
#Write a script that loops through the gapminder data by continent and prints out whether the mean life expectancy
#is smaller or larger than 50 years.
gapdata<-read.csv(file = 'data/gapminder-FiveYearData.csv')
unique(gapdata$continent)
head(gapdata)
sample(gapdata,size = 20)


#How?
#1 Loop over unique continent names
#2 for each "continent" creat a temp variable that holds the life expectancy
#3 Print the output

#contname is like "i" above
for(contname in unique(gapdata$continent)){
  templifeexp <- mean(subset (gapdata,continent == contname)$lifeExp) 
  #$ makes sure we only compute the one column we want (lifeExp)
  
  cat("Average life expectancy for", contname,"is",templifeexp,"\n")
  #the function cat does not use/do enters... so "\n" means "enter"
  
  rm(templifeexp) #removing temporary data is just good programming practice (takes up memory space and clutters)
}





