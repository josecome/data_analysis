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


# Optimal number of cluster using Silhouette
fviz_nbclust(df, FUN = hcut, method = "silhouette", k.max = 10) + ggtitle("Silhouette")

# Optimal number of cluster using Gap Statistic
fviz_nbclust(df, FUN = hcut, method = "gap_stat", k.max = 10) + ggtitle("Gap stat")

# Hierarchical clustering with ward method
hc.res <- eclust(df_scaled, "hclust", hc_metric = "euclidean", hc_method = "ward.D2", k = 2, graph = FALSE)

#Hierarchical plot
fviz_silhouette(hc.res, palette = "jco", ggtheme = theme_classic())

#Visualizando os resultados do algoritmo
hc.clusters<-hc.res$cluster
fviz_cluster(list(data=df_scaled, cluster = hc.clusters))

fviz_dend(hc.res) # dendrogam

cluster_df <- as.data.frame(hc.res$cluster)
df_final <- cbind(df, cluster_df)

# Average in each cluster
clusterGroups = cutree(hc.res, k = 2)
tapply(df$sepal.length, clusterGroups, mean)
tapply(df$sepal.width, clusterGroups, mean)
tapply(df$petal.length, clusterGroups, mean)
tapply(df$petal.width, clusterGroups, mean)

