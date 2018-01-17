# Exploring data frames


#Load in the data
cats<- read.csv("data/feline-data.csv")
cats
str(cats)
?str


#Add a col to an existing dataframe
age<-c(2,3,5)

#Bind the cats dataframe to the new "age" vector
cbind(cats,age)
cats

#What if the new column was longer?
age<-c(2,3,5,9)
cbind(cats,age)


#Done proper:
age<-c(2,3,5)
cats<- cbind(cats,age)
cats

#Adding a new row:
new_row <- list ("Tortoishell",3.3,TRUE,9)
cats <- rbind(cats, new_row)
cats
# it gives a warning, and turns Tortoishell into NA
# The TRUE is already defined by 1 (it is NOT a coercion!)
# but  "Tortoishell" is not an already existing level of the factor coat.

#Factors
levels(cats$coat)
levels(cats$coat) <-c(levels(cats$coat),"tortoishell")

new_row <- list ("tortoishell",3.3,TRUE,9)
cats <- rbind(cats, new_row)
cats

##Challenge 1

#Let’s imagine that, like dogs, 1 human year is equivalent to 7 cat years.
#(The Purina company uses a more sophisticated alogrithm).
#Create a vector called human.age by multiplying cats$age by 7.
human.age<-cats$age * 7
human.age
#Convert human.age to a factor.
human.age<-as.factor(human.age)
human.age
#Convert human.age back to a numeric vector using the as.numeric() function.
human.age<-as.numeric(human.age)
human.age
#Now divide it by 7 to get back the original ages. Explain what happened.
human.age/7
#Converting the factor to a numeric vector gives us the underlying integers, not the labels.
#If we want the original numbers, we need to convert human.age to a character vector and then to a numeric vector
#(why does this work?).
#"Character" will take the label instead of the underlying integer

#This comes up in real life when we accidentally include a character somewhere in a column of a .csv file that is
#supposed to only contain numbers, and forget to set stringsAsFactors=FALSE when we read in the data.


#We now know how to add rows and columns to our data frame in R,
#but in our first attempt to add a ‘tortoiseshell’ cat to the data frame we’ve accidentally added a garbage row:
cats

#We can ask for a data frame minus this offending row:
  
cats[-4,]

#Notice the comma with nothing after it to indicate we want to drop the entire fourth row.
#Note: We could also remove both new rows at once by putting the row numbers inside of a vector:
cats[c(-4,-5),]
#Alternatively, we can drop all rows with NA values:
na.omit(cats)
#note that this would remove anything with NA values, not just of one column
na.omit(cats$coat)

#Let’s reassign the output to cats, so that our changes will be permanent:
cats <- na.omit(cats)
cats

#Fix the rownames indexing
rownames(cats)<- NULL
cats


#Challenge 2
#You can create a new data frame right from within R with the following syntax:
df <- data.frame(id = c('a', 'b', 'c'),
                   x = 1:3,
                   y = c(TRUE, TRUE, FALSE),
                   stringsAsFactors = FALSE)
df
#Make a data frame that holds the following information for yourself:
#first name
#last name
#lucky number
my_dataframe<-data.frame(firstname= c("Jens"),
                         lastname= c("Van Eeckhoven"),
                         luckynumber= c(36),stringsAsFactors = FALSE)
#Then use rbind to add an entry for the people sitting beside you.
neighbours<-list(c("Macary","Laura"),c("Mu","Musgrove"),c(2,7))
my_dataframe<-rbind(my_dataframe,neighbours)
my_dataframe
#Finally, use cbind to add a column with each person’s answer to the question, “Is it time for coffee break?”
IsItTimeForCoffeeBreak<-c(TRUE,TRUE,TRUE)
my_dataframe<-cbind(my_dataframe,IsItTimeForCoffeeBreak)
my_dataframe


#Realistic example
#So far, you’ve seen the basics of manipulating data frames with our cat data; now, let’s use those skills to digest a more realistic dataset. Let’s read in the gapminder dataset that we downloaded previously:
  
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

#Miscellaneous Tips
#Another type of file you might encounter are tab-separated value files (.tsv).
#To specify a tab as a separator, use "\\t" or read.delim().
#Files can also be downloaded directly from the Internet into a local folder of your choice onto your computer
  #using the download.file function.
#The read.csv function can then be executed to read the downloaded file from the download location, for example,
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder-FiveYearData.csv")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

#Alternatively, you can also read in files directly into R from the Internet by replacing the file paths
#with a web address in read.csv.
#One should note that in doing this no local copy of the csv file is first saved onto your computer. For example,
gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv")

#You can read directly from excel spreadsheets without converting them to plain text first by using the readxl package.

#Let’s investigate gapminder a bit; the first thing we should always do is check out what the data looks like with str:
str(gapminder)

#We can also examine individual columns of the data frame with our typeof function:
typeof(gapminder$year)
typeof(gapminder$country)
str(gapminder$country)

#We can also interrogate the data frame for information about its dimensions;
#remembering that str(gapminder) said there were 1704 observations of 6 variables in gapminder,
#what do you think the following will produce, and why?
length(gapminder)

#A fair guess would have been to say that the length of a data frame would be the number of rows it has (1704),
#but this is not the case; remember, a data frame is a list of vectors and factors:
typeof(gapminder)
#When length gave us 6, it’s because gapminder is built out of a list of 6 columns.
#To get the number of rows and columns in our dataset, try:
nrow(gapminder)
ncol(gapminder)

#Or, both at once:
dim(gapminder)

#We’ll also likely want to know what the titles of all the columns are, so we can ask for them later:
colnames(gapminder)

#At this stage, it’s important to ask ourselves if the structure R is reporting matches our intuition or expectations;
#do the basic data types reported for each column make sense?
#If not, we need to sort any problems out now before they turn into bad surprises down the road,
#using what we’ve learned about how R interprets data, and the importance of strict consistency in how we record our data.

#Once we’re happy that the data types and structures seem reasonable, it’s time to start digging into our data proper.
#Check out the first few lines:
head(gapminder)

#Challenge 3

#It’s good practice to also check the last few lines of your data and some in the middle. How would you do this?
tail(gapminder)
#middle 20 values
1704/2
gapminder[842:862,]
#Searching for ones specifically in the middle isn’t too hard but we could simply ask for a few lines at random.
#How would you code this?
#The solution here presents one form using nested functions.
#i.e. a function passed as an argument to another function.
#This might sound like a new concept but you are already using it in fact.
#Remember my_dataframe[rows, cols] will print to screen your data frame with the number of rows and columns you asked for
#(although you might have asked for a range or named columns for example).
#How would you get the last row if you don’t know how many rows your data frame has?
#R has a function for this. What about getting a (pseudorandom) sample? R also has a function for this.
gapminder[sample(nrow(gapminder), 5), ]




#To make sure our analysis is reproducible, we should put the code into a script file so we can come back to it later.

#Challenge 4
#Go to file -> new file -> R script, and write an R script to load in the gapminder dataset.
#Put it in the scripts/ directory and add it to version control.
#Run the script using the source function, using the file path as its argument
#(or by pressing the “source” button in RStudio).
source(file = "scripts/load_gapminder.R")


#Challenge 5
#Read the output of str(gapminder) again; this time, use what you’ve learned about factors, lists and vectors,
#as well as the output of functions like colnames and dim to explain what everything that str prints out for gapminder means.
#If there are any parts you can’t interpret, discuss with your neighbors!

str(gapminder)
#The object gapminder is a data frame with columns
##country and continent are factors.
##year is an integer vector.
##pop, lifeExp, and gdpPercap are numeric vectors.
