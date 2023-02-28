#Function to normalize data

#Min-Max normalization function
min_max_norm <- function(x) {
    (x - min(x)) / (max(x) - min(x))
}

v <- c(1,2,4,2,6,8,2,3,4,9,2,1,8,5,6)
norm <- min_max_norm(v)
print(norm)

df <- data.frame(x = rnorm(8, 22, .3))
norm_df <- scale(df)
