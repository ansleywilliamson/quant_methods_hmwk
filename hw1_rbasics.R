#' ---
#' title: HW1: Basics
#' author: Ansley Williamson
#' date: January 17, 2023
#' output: html_document
#' ---

tgpp <- read.csv("~/documents/statprog/tgpp.csv")
head(tgpp)

#tgpp <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/
#                 gh-pages/data/tgpp.csv')

#' 1. What are the names of the columns in this dataset?
colnames <- names(tgpp)
print(colnames)
    
#' 2. How many rows and columns does this data file have?

rowcolnum <- dim(tgpp)
print(rowcolnum)

#' 3. What kind of object is each data column? Hint: checkout the function 
#' sapply().

object_type <- sapply(tgpp, class)
print(object_type)

#' 4. What are the values of the datafile for rows 1, 5, and 8 at columns 3, 7,
#' and 10?

dat[1, 3]  #1
dat[5, 7]  #3
dat[8, 10] #3

#' 5. Create a pdf of the relationship between the variables “scale” and “richness”.
#' Scale is the area in square meters of the quadrat in which richness was 
#'recorded. Be sure to label your axes clearly, and choose a color you find 
#' pleasing for the points. To get a list of available stock colors use the 
#'function colors(). 

plot(1:length(tgpp$scale), tgpp$richness, xlab='scale (sqm)', 
     ylab='richness', main='The Relationship Between Scale and Richness',
     col="olivedrab")

#' 6. What happens to your plot when you set the plot argument log equal to ‘xy’. 
#' plot(..., log='xy')

plot(1:length(tgpp$scale), tgpp$richness, log='xy', xlab='scale (sqm)', 
     ylab='richness', main='The Relationship Between Scale and Richness',
     col="olivedrab")

# The logarithmic plot caused the points to consolidate closer to the right side
# of the plot nearing 5000, whereas the original plot's points were evenly 
#distributed between 0 and 4000.

