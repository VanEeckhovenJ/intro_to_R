#Creating graphics
#Author: Jens Van Eeckhoven
#Date: 24 January 2018

# ggplot2
#gg = grammar of graphics


#to use ggplot2
if("ggplot2" %in% installed.packages()){
  print("ggplot2 is already installed")
}else{
  install.packages("ggplot2")
}


#to use it:
library("ggplot2")

#good practice to reload the data:
gapdata<-read.csv(file="data/gapminder-FiveYearData.csv")
ggplot(data = gapdata, aes (x = gdpPercap, y = lifeExp)) + geom_point()

  # R needs to have the "+" on the same line, otherwise it thinks the function is already finished

#"data" = data on which this plot will be generated
#"aes" = "aesthetics" 



#Challenge 1
#Modify the example so that the figure shows how life expectancy has changed over time:
?sample
gapdata[sample(nrow(gapdata), 20), ]

ggplot(data = gapdata, aes(x = year, y = lifeExp)) + geom_point()
#


#Hint: the gapminder dataset has a column called “year”, which should appear on the x-axis.



#Challenge 2
#In the previous examples and challenge we’ve used the aes function to tell the scatterplot geom about the x and y locations
#of each point. Another aesthetic property we can modify is the point color.
#Modify the code from the previous challenge to color the points by the “continent” column.
#What trends do you see in the data? Are they what you expected?
?ggplot
ggplot(data = gapdata, aes(x = year, y = lifeExp, colour = continent)) + geom_point()
?aes

#Layers
ggplot(data = gapdata, aes(x = year, y = lifeExp, by = country, colour = continent)) +
  geom_line() + geom_point()

ggplot(data = gapdata, aes(x = year, y = lifeExp, by = country)) +
  geom_line(aes (colour=continent)) + geom_point()

ggplot(data = gapdata, aes(x = year, y = lifeExp, by = country)) + geom_point() +
  geom_line(aes (colour=continent)) 




#Transformations and statistics

#Ggplot also makes it easy to overlay statistical models over the data. To demonstrate we’ll go back to our first example:
  
  ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point()

#Currently it’s hard to see the relationship between the points due to some strong outliers in GDP per capita.
#We can change the scale of units on the x axis using the scale functions.
#These control the mapping between the data values and visual values of an aesthetic.
#We can also modify the transparency of the points, using the alpha function,
#which is especially helpful when you have a large amount of data which is very clustered.
  
  ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) + scale_x_log10()
  
#The log10 function applied a transformation to the values of the gdpPercap column before rendering them on the plot,
#so that each multiple of 10 now only corresponds to an increase in 1 on the transformed scale,
#e.g. a GDP per capita of 1,000 is now 3 on the y axis, a value of 10,000 corresponds to 4 on the y axis and so on.
#This makes it easier to visualize the spread of data on the x-axis.
  
#Tip Reminder: Setting an aesthetic to a value instead of a mapping
#Notice that we used geom_point(alpha = 0.5). As the previous tip mentioned,
#using a setting outside of the aes() function will cause this value to be used for all points,
#which is what we want in this case. But just like any other aesthetic setting,
#alpha can also be mapped to a variable in the data.
#For example, we can give a different transparency to each continent with geom_point(aes(alpha = continent)).
  ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(alpha = continent)) + scale_x_log10()
  
  
#We can fit a simple relationship to the data by adding another layer, geom_smooth:
    ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point() + scale_x_log10() + geom_smooth(method="lm")
    
    
#We can make the line thicker by setting the size aesthetic in the geom_smooth layer:
      
      ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
      geom_point() + scale_x_log10() + geom_smooth(method="lm", size=1.5)
    
#There are two ways an aesthetic can be specified.
#Here we set the size aesthetic by passing it as an argument to geom_smooth.
#Previously in the lesson we’ve used the aes function to define a mapping between data variables and their visual representation.
      
#Challenge 4a
#Modify the color and size of the points on the point layer in the previous example.
#Hint: do not use the aes function.
      ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
        geom_point(colour="red") + scale_x_log10() + geom_smooth(method="lm", size=1.5)

#Challenge 4b
#Modify your solution to Challenge 4a so that the points are now a different shape
      #and are colored by continent with new trendlines.
      #Hint: The color argument can be used inside the aesthetic.

  



