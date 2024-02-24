# Today we going to talk about Hierarchical clustering, 
# The objective of these methods is to group clusters to form a new one,
# or separate an existing one to give rise to two others, so that the distance function is minimized 
# or some similarity measure is maximized. Hierarchical methods can be divided into agglomerative and 
# divisive.

# Agglomerative Hierarchical clustering: It starts at individual 
# leaves and successfully merges clusters together. Its a Bottom-up approach.
# While 
# Divisive Hierarchical clustering: It starts at the root and 
# recursively split the clusters. It’s a top-down approach.

# So, in the first step, we have as many points as the number of clusters
# and we gradually merge more and more clusters until all points are in one clusters
# In each step the cluster that are close together are always merged
# To know how closest points are, we need to calculate distance between two points
# And connect points


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

# Cutting tree by number of clusters
fit <- cutree(h_clust, k = 2 )
fit

table(fit)
rect.hclust(h_clust, k = 2, border = "orange")

cluster_df <- as.data.frame(fit)
df_final <- cbind(df, cluster_df)
