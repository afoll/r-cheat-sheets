#Clear environment, set working directory, and run header
rm(list=ls())
setwd("/Users/georgefollett/Research")
source("/Users/georgefollett/Research/R Training/header.R")

#####################################
#Title:     Data Manipulation Training Wheels
#Summary:   Basics of data manipulation

#Read in some test data
dat <- 
    read.csv("http://mgimond.github.io/ES218/Data/FAO_grains_NA.csv", header=TRUE)

#dplyr examples use this flowery database
iris <- iris

#Extract column values as a VECTOR using dplyr's pull function.  (note there is a distinciton between Vectors and Tables.)  Reference the first column in the table either by sequence number or name.
x <- pull(dat, 1)
y <- pull(dat, Country)
x==y

#Rename a variable
dat <- rename(dat, Nation = Country)


vars <- c(var1 = "cyl", var2 ="am")
select(mtcars, !!vars)
mtcars2 <- rename(mtcars, !!vars)


#Assign a variable based on table conditions.  E.g., what is the official data's estimate for Canada's 2012 oat production?
    