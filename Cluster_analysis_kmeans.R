library(dplyr)
library(gdata)
library(tidyr)
library(corrplot)
library(factoextra)

# Getting data from iris file
df <- read.csv('iris.csv')

# Taking the first 4 columns
df <- df[,1:4]

# Get columns names
names(df)

# Getting number of rows
nrow(df)

# Display Boxplot of variables
par(mfrow=c(2, 2))
for(i in 1:4) {
  boxplot(df[,i], main=names(df)[i])
}

par(mfrow=c(1 ,1))

# Getting correlation between variables
correlated_df <- cor(df, df, method="spearman", use="pairwise.complete.obs")

# Display correlation charts
corrplot(correlated_df, sig.level=0.05, insig = "blank", type="upper", method="color", addCoef.col = "black", number.cex=.8)


# Scaling the data
df_scaled <- scale(df)

# Calculate distances using Euclidian method
df_dist_eucl <- dist(df_scaled, method="euclidean")

# Optimal number of cluster using Silhouette
fviz_nbclust(df_scaled, kmeans, method = "silhouette")+ theme_classic()

# Optimal number of cluster using Gap Statistic
fviz_nbclust(df_scaled, kmeans, method = "gap_stat")

# K-means clustering, k = 2
km.res <- eclust(df_scaled, "kmeans", k = 2, nstart = 25, graph = FALSE)

#Silhouette plot
fviz_silhouette(km.res, palette = "jco", ggtheme = theme_classic())

# Print results of analysis
print(km.res)

km.clusters<-km.res$cluster
fviz_cluster(list(data=df_scaled, cluster = km.clusters))

cluster_df <- as.data.frame(km.res$cluster)
df_final <- cbind(df, cluster_df)

# Average in each cluster
km.res$centers
