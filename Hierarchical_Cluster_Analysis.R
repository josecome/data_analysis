library(dplyr)
df <- iris
df <- df[,1:4]
# Finding distance matrix
df_dist <- dist(df, method = 'euclidean')
df_dist

set.seed(123) # Setting seed

# Trainning Dataset
h_clust <- hclust(df_dist, method = "average")
h_clust

# Plotting dendrogram
plot(h_clust)

# Cutting tree by no. of clusters
fit <- cutree(h_clust, k = 2 )
fit

table(fit)
rect.hclust(h_clust, k = 2, border = "orange")

cluster_df <- as.data.frame(fit)
df_final <- cbind(df, cluster_df)
