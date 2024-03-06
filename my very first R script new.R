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
roll <- function(){
  die = 1:6
  dice = sample(x = die, size = 2, replace = 2)
  sum(dice)
}



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

library("ggplot2")
qplot()
x <- c(-1, 0.8, 0.5, 3, -2, 10, 1.1, 5)
x <- sort(x)
y <- x^3
y
plot(x,y, type ="b")

# if we don't give a y value qplot generates histograms
qplot(x, binwidth = 1)


#write a function that rolls a pair of dice and report their sum
roll_fair <- function(){
  dice <- sample(x = 1:6,size = 2,replace = TRUE)
  return(sum(dice))
}

#write a function that rolls a pair of loaded dices
----
  
  roll.loaded <- function() {
    die = 1:6
    dice = sample(x = die, size = 2, replace = TRUE, prob = c(1/7, 1/7, 1/7, 1/7, 1/7, 2/7))
    sum(dice)
  }

roll.loaded()

  fig1 <- ggplot2::qplot(fair_sums)
fig2 <- ggplot2::qplot(loaded)


?cowplot
install.packages
library(cowplot)
?cowplot

# let's roll a dice many times and look at its histogram

# let's take a closer look at the help page for "replicate"
?replicate

fair.dice <- replicate(n = 1e5, expr = roll())
qplot(fair.dice, binwidth = .5)


# note we can cancel a command with the short-cut ctrl + c (cancel)  or 
# clicking the "stop" button on the top of the console.
replicate(n = 1e7, expr = roll())


rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

roll_many(n) # --> roll n pairs of dice and return the sums
roll_many <- function(n=){
  roll_fair <- function(){
    sum()
  }
  replicate(n, roll_fair())
}

qplot(roll_many(1e4))  

#part from tidyverse, called pipe which means and then  
%>%   |>
  library(magrittr)
x<-3
y<- exp(x)
z <- sqrt(y)  
t <- log10(z)
s <- abs(t)

s <- x %>%
  exp() %>%
  sqrt()  %>%
  log10() %>%
  abs()

substraction <- function(x,y){
  return(x-y)
}

x<- 3
x  %>%
  substraction(1)

x  %>%
  substraction(1, .)
# the . is indicating the location of the argument before the pipe, would use second position per default

x %>%

  
  # R Objects-----
# atomic vectors, basic types (integers, character, logicals, compplex, raws but just one type per object), coercion, matrices and arrays, attrubtes and class, list and data frames, loading and saving data
die
is.vector(die)
length(die)
#will use very common

five <- 5
is.vector(five)
length(five)

typeof(die +0.0)
typeof(five)

near(sqrt(2)^2-2)

logicals <- c(TRUE, FALSE)
logicals
typeof(logicals)

text <- c("Hello", "World")
length(text)
typeof(text)

five <- 5L
typeof(five)

#Coercion ----
logicals
int <- c(1L, 5L)

c(logicals, int)
logicals %>%
  c(int)

as.logical(int)

logicals %>%
  c(int) %>%
  c(die) %>%
  c(text) %>%
  typeof()  

logicals %>%
  c(int) %>%
  c(die) %>%
  c(text) %>%
  
  as.numeric()
as.logical()
as.character()


# Bootcamp R-Introduction week day 2 March 5th
#load necessary libraries
library(useful)


#a royal flush
hand <- c("ace", "king", "queen", "jack", "ten")
typeof(hand)
length(hand)

#Matrix---
#Matrices are 2 dimensional vectors, has to be the same type as you can't mix characters and numbers
?matrix()
die = 1:6
matrix(data=die)
# makes a matrix out of the vector
matrix(data=die, nrow =2)
m<-matrix(data=die, nrow =2)
matrix(data=die, ncol = 2)
#define the number of rows or columns you want
matrix(die, ncol = 3, byrow = TRUE)
# say true to fill rows first, than columns, by default it will first fill columns
#if you use a vector of 7 elements (ungerade Anzahl), it will recycle and start again with the first element of the vector

# arrays are multi dimensional vectors
array(c(11:14, 21:24, 31:34),
      dim=c(2,2,3))

ar <- array(c(11:14, 21:24, 31:34),
      dim=c(2,2,3))
#2, 2, 3 are the different dimensions of the array

attributes(die)
attributes(m)

names(die) <- c("one", "two", "three", "four", "five", "six")
attributes(die)
die
typeof(die)

dim(die)<-c(2,3)
die
attributes(die)
#as we have turned die into a matrix, there are no names anymore
rownames(die)<- c("r1", "r2")
colnames(die)<- c("c1", "c2", "c3")
die
attributes(die)
colnames(die)<- NULL
#to get rid of column names
die
class(die)
#matrix and arrays are efficient storage

#Lists----
#Lists: can contain multiple types, adding an element is "cheap", is one dimensional
#we use lists to group arbitrary objects
list(1:100, 3, "five", mean, matrix(1:12, 3, 4))
#it pastes all the elements of the vector and calls them element 1-5 in double eckige klammern
list1 <-list(1:100, 3, "five", mean, matrix(1:12, 3, 4))
list1
names(list1) <- c("vector", "numeric", "character", "func", "matrix")
list1

list2 <-list("vector" = 1:100, 
             "numeric" = 3, 
             "character" ="five", 
             "funct" = mean, 
             "matrix" =matrix(1:12, 3, 4))
list2
#you can name the elements directly

#Dataframes
# a data frames is a list of vectors if same length
#adding a column is "cheaper" than adding a row
df<- data.frame(face = c("ace", "two","six"),
           suit = c("clubs", "clubs", "clubs"),
           value = c(1,2,3))
df

#if any of the entries is a constant, it will be recycled"
data.frame(face = c("ace", "two","six"),
           suit = c("clubs", "clubs", "clubs"),
           value = 1)

typeof(df)
class(df)
str(df)


#create a set of card

?base::rep

rep(c("a", "b", "c"),2)

data.frame(let =rep(c("a", "b", "c"),6),
           num =rep(c(1,2,3,4,5,6),3))

faces <- c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace")
suits <- c("spades", "clubs", "diamonds", "hearts")
#for the values, use seq function (von 13 nach 1 immer -1 zwischen Werten)
values <- seq(13,1,-1)

#create the deck
deck <- data.frame(suit = rep(suits, each = 13),
                   face = rep(faces, times = 4),
                   value = rep(values, times = 4))
deck

#how to save and load a data.frame
write.csv(x=deck, file ="Data/deck.csv")
deck.read <- read.csv("Data/deck.csv")
deck.read

write.csv(x=deck, file="Data/deck.csv", row.names = FALSE)
deck.read <- read.csv("Data/deck.csv")
deck.read

head(deck, n=10)
tail(deck)
summary(deck)
str(deck)

list1
saveRDS(list1, file = "Data/list.RDS")
list1.read <- readRDS("Data/list.RDS")
list1.read

deck.read<- data.table:: fread("Data/deck.csv")
deck.read

random_matrix <- matrix(rnorm(3000), 50)
dim(random_matrix)
head(random_matrix)

corner(random_matrix)

write.csv(random_matrix, "Data/random_matrix.csv")

random_matrix.read <- read.csv("Data/random_matrix.csv")

random_matrix.read %>% corner


install.packages("tidyverse")
library(tidyr)


random_matrix.read <- data.table::fread("Data/random_matrix.csv")
  
# or read file by importing and clicking on the environment button

#  dicing and selecting the data set ----
#Slicing use [] 
dim(deck)
head(deck)
nrow(deck)

deck[1,1]
deck[1,1:3]
deck[1:5, 2:3]
deck[,0]
deck[1:5, -3]
# negative is to drop somethin = anything but 
deck[1:4, c(-1, -3)]
#you can't mix positive and negative
deck[1:4, c(-1, 3)]

deck[1:4,c("suit", "value")]

names(die) <- c("one", "two", "three", "four", "five", "six")
die
die["three"]

deck[1:4, c(TRUE, FALSE, TRUE)]
deck[,2]
deck[1:3, 2, drop = FALSE]
deck$suit
deck$face
#with the $ you can choose just one column
deck$suit == "spade"
deck[deck$suit=="spades",]

list1$vector
list1$character
list1[1]
list1[1:2]

list2 <- list1[1]
list2
list2 %>% class()
length(list2)

vector2 <- list1[1]
vector2

list1[1:2]

list1$vector

deck$value %>%
  median()

deck$suit %>%
unique()

deck$suit %>%
  table()

suit.table <- deck$suit %>%
  table()
suit.table["clubs"]
deck$suit == "clubs"
sum(deck$suit == "clubs")
#it counts the TRUES 

mean(deck$suit == "clubs")

#Modifying values ------
#changing in-place
#logical subsetting >, >=, <, <=, ==, !=, %in%, &. |, xor, !, any, all
#missing values

# a fresh copy of the deck
deck2 <-deck
vec <- rep(0,6)
vec
vec[1]
vec[1] <- 100
vec
# you can modify one part of it

vec[c(1,3,5)] <-c(1,2,1)
vec
# to replace and modify the sliced parts
vec[4:6] <- vec[4:6]+1
vec
vec[1:3] <-vec[1:3]+vec[4:6]
vec
vec[7]
vec[7] <-0
vec
#to extend the vector
vec[7] <-NA
vec
vec[7] <-NULL
vec[7] <-0
vec <-vec[-7]
vec
#to get rid of the last element

deck2 %>%
  head()
deck2$new <-1:52
deck2 %>% head
#to add a new column

deck2$new <-NULL
deck2 %>% 
  head()
# NULL is not existent

deck2 %>% 
  head()

#exercise: change the value of ace to 14 points
#first define where the aces are: for the first dimension take all the aces

deck2[c(13,26,39,52), 3] <- c(14,14,14,14)
deck2
#or use... doing the same thing
deck2[c(13,26,39,52), 3] <- 14
deck2$value[c(13,26,39,52)] <-14
deck2[c(13,26,39,52), ]$value <- 14
deck2[c(13,26,39,52), "value"] <- 14
deck2


sample(10)

#shuffle your deck (create permutations) using sample
deck3 <- deck[sample(52),]
deck3

#find the aces is the shuffled deck
deck3$face

deck3$face =="ace"

deck3[deck3$face =="ace", ]


deck3[deck3$face =="ace", 3] <-14
deck3

#some simple examples with booleans
1>2
2>1
1> c(0,1,2)
c(1,2) > c(0,1,2) #it recycles
c(1,2,3) == c(3,2,1)
all(c(1,2,3) == c(3,2,1))

1 %in% c(3,4,5)
c(1,2) %in% c(3,4,5)
c(1,2,3,4) %in% c(3,4,5)

any(1==c(3,4,5)) # is the same as 1 %in% c(3,4,5)


#exercise
deck4 <-deck
deck4 <- deck[sample(52),]
deck4
# change all the values to 0 apart from hearts
deck4$suit =="hearts"
hearts <-deck4$suit =="hearts"
hearts
not_hearts <- deck4$suit!="hearts"
deck4[hearts, 3] <--1
deck4[!hearts, 3] <-0
deck4$value <-0
deck4$value<-0
deck4[hearts,3] <-1
deck4

#change: all hearts 1, queen of spades 13, all the rest 13
deck4$face =="queen"
queen <- deck4$face =="queen"

deck4$suit == "spades"
spades <-deck4$suit == "spades"


deck4[queen & spades, "value"] <-13 # or use 3 for value because it is the 3rd column
deck4

#NA are contigious
1 + NA 
NA == 1
c(NA, 1:50)
mean(c(NA, 1:50))
#for any command with NA it will give you NA

mean(c(NA, 1:50), na.rm =TRUE) # to ignore NA

x <- c(NA, 1:50)
x

is.na(x)
x[!is.na(x)]
x <- c(NA, 1:50, 1/0)
x

is.finite(x)

# write a function that takes a deck as input and a number of cards. pick 5 cards
deck
deal <- function(deck, n=5){
  n.deck <-nrow(deck)
  shuffled_deck <-deck[sample(n.deck),]
  hand <-head(shuffled_deck, n)
  rest <- tail(shuffled_deck, n.deck-n)
  return(list(hand=hand,rest=rest))
}

deal

current.deck <- deck
temp <-deal(current.deck)
hand1 <- temp$hand
current.deck <- temp$rest

temp <- deal(current.deck)
hand2 <- temp$hand
current.deck <- temp$rest

temp <- deal(current.deck)
hand4 <- temp$hand
current.deck <- temp$rest

hand1
hand2
hand4

#download TIER

#missed 1.5hrs due to meeting CyCIF

install.packages(c("remotes", "usethis"))
install.packages('devtools')
library(devtools)
devtools::install_github("https://github.com/broadinstitute/taigr")