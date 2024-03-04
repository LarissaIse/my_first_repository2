# -----
# My very first introduction to R
# Author: Larissa Isenegger
# Date: 03 04 2024
# Descriprion: First lecture notes from the CP Bootcamp
# -----

# Introduction ----

3+4
3*5
3+5 ; 12-8
# better to separate your commands on two separate lines
6/2^2-1
# R follows mathematical rules, but better to put ()

# create a vector from 1 to 6
1:6 
23:59

#Objects----
# create an object (use assignement operator for it <-)
a <- 3
# a will show up in the environment panel
# make an operation with your object
a +4
die <- 1:6
# name your object
namesAreCaseSensitive <- 3
namesAreCaseSENSITIVE <- 5
# watch out for capital letters
# names cannot start with a number and will give you an error
1object <-100 
# names cannot start with a special character as @ etc.
# some words can not be used, as NA, NULL, TRUE and it gives an error
NA <- 3
# use underscores_or_dots.to.separate but stay consistent 
# use ls() to show all your objects


#elementwise operations
die
die-1
#it will substract 1 from every element 
die *2
#it will multiply every element with 2
die*die
#it will multiply first element with first element and second with second 
die %*% die
# for the inner product (Skalarprodukt)
die *1:2
# R will use recycling: it add up the shorter vector to the lenght of the longer one 
die * c(1,2,1,2,1,2)
#different vector length
die *1:4
#it recycles until it reaches the size and then chops it off

die
rep(1/6,6)
probability = rep(1/6, 6)
sum(die*probability)
die %o% probability


#Functions----
#functions always have ()
round(3.5)
rnorm(1)
factorial(5)
exp(2)
log(2)
log2(16)
#if you type the name of the function, use word recognition, it will show you what it expects
rnorm(n=10, mean=0, sd=3)
#you can also use a vector for a function
mean(1:10)
#use function in a function
round(mean(1:10))
#if things get more complicated, better split them up 
a <- exp(2)
rounded_a <- round(a)
#functions can take multiple arguments
sample(x = die,size = 2,replace = TRUE)
#with replacement = mit zurücklegen
sample(die,2,TRUE)
sample(size = 2, x = die, replace = TRUE)
# some things are essential for a function, some will be replaces by default
sample(size = 3)
#ask for help for the funtion
?sample
#if you don't know the exact name of the function, use ?? to find functions with similar names
#if you enter the function withouth () it will show you the code for it
#structure of functions: name, argument, default value, last line of code

roll2 <- function(){
  dice <- sample(x = 1:6, size = 2, replace = TRUE)
  sum(dice)
}
roll2()
roll2()
outcome <- roll2()
outcome

die
roll2 <- function(die=1:6){
  dice <- sample(x = die, size = 2, replace = TRUE)
  return(sum(dice)) }

#be explicit

dice <- sample(x = die,size = 2,replace = TRUE)
sum(dice)

#Packages-----
#install from CRAN.R or use install.packages
?install.packages

install.packages("useful")
#more resource: bioconductor

qplot()
x <- c(-1, 0.8, 0.5, 3, -2, 10, 1.1, 5)
x <- sort(x)
y <- x^3
y
plot(x,y, type ="b")


