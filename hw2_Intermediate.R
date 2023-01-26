#' title: "HW2 R intermediate"
#' author: "Ansley Williamson"
#' date: '`r paste("First created on 2015-01-29. Updated on", Sys.Date())`'
#' output: html_document

data(iris)
head(iris)

# remove repeat values to create species list
sp_ids <- unique(iris$Species)

# set up output matrix to capture values, 0 or NA is better
output <- matrix(NA, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(output) <- sp_ids
colnames(output) <- names(iris[ , -ncol(iris)])
#' 1. Describe the values stored in the object output. In other words what did the 
#' loops create?
    
#' 2. Describe using pseudo-code how output was calculated.

# 1:length(sp_ids) 
# Loop from 1 to length of species identities.
for(i in seq_along(sp_ids)) {
    # subset data down to specific species, drop "species" column
    iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species)
    # Loop from 1 to number of columns in iris species.
    for(j in 1:(ncol(iris_sp))) {
        x <- 0
        y <- 0
        # if the number of rows in iris species is greater than 0
        if (nrow(iris_sp) > 0) {
            # then loop from 1 to number of rows in iris species
            for(k in 1:nrow(iris_sp)) {
                # x becomes sum of each column (traits), then is reset to 0 for 
                # new trait.
                x <- x + iris_sp[k, j]
                # y is number of rows/sample size.
                y <- y + 1
            }
            output[i, j] <- x / y #output is the avg of each trait per species.
        }
    }
}
output

#' 3. The variables in the loop were named so as to be vague. How can the objects
#' output, x, and y be renamed such that it is clearer what is occurring in the loop.

trait_avg <- matrix(NA, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(trait_avg) <- sp_ids
colnames(trait_avg) <- names(iris[ , -ncol(iris)])

for(i in seq_along(sp_ids)) {
    # subset data down to specific species, drop "species" column
    iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species)
    # Loop from 1 to number of columns in iris species.
    for(j in 1:(ncol(iris_sp))) {
        trait_sum <- 0
        n_sample <- 0
        # if the number of rows in iris species is greater than 0
        if (nrow(iris_sp) > 0) {
            # then loop from 1 to number of rows in iris species
            for(k in 1:nrow(iris_sp)) {
                trait_sum <- trait_sum + iris_sp[k, j]
                n_sample <- n_sample + 1
            }
            trait_avg[i, j] <- trait_sum / n_sample #output is the avg of each 
            #trait per species.
        }
    }
}
trait_avg

#' 4. It is possible to accomplish the same task using fewer lines of code? 
#' Please suggest one other way to calculate output that decreases the number of
#' loops by 1.
trait_avg <- matrix(NA, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(trait_avg) <- sp_ids
colnames(trait_avg) <- names(iris[ , -ncol(iris)])

for(i in seq_along(sp_ids)) {
    iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species)
    for(j in 1:(ncol(iris_sp))) {
        trait_avg[i, j] <- mean(iris_sp[ , j]) 
    }
}
        
trait_avg

#' Sum of a sequence

# 5. You have a vector x with the numbers 1:10. Write a for loop that will 
# produce a vector y that contains the sum of x up to that index of x. So for 
# example the elements of x are 1, 2, 3, and so on and the elements of y would 
# be 1, 3, 6, and so on.

x <- 1:10
y <- NA

for(i in 1:length(x)) {
    #add all of x values together to create y point
    y[i] <- sum(x[1]:x[i])
}
y

if (nrow(iris_sp) > 0) {
    # then loop from 1 to number of rows in iris species
    for(k in 1:nrow(iris_sp)) {
        # x becomes sum of each column (traits), then is reset to 0 for 
        # new trait.
        x <- x + iris_sp[k, j]
        # y is number of rows/sample size.
        y <- y + 1
        
# 6. Modify your for loop so that if the sum is greater than 10 the value of y 
# is set to NA.

# 7. Place your for loop into a function that accepts as its argument any vector
# of arbitrary length and it will return y.
        
        
        #how many fib numbers would you like the function to return?

       