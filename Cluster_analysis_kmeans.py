from sklearn import datasets,cluster
import pandas as pd
 
iris = datasets.load_iris()
df = pd.DataFrame(
    iris.data, 
    columns=iris.feature_names
    )

print(df.head())

k_means = cluster.KMeans(n_clusters=2, max_iter=50, random_state=1)
k_means.fit(df) 
labels = k_means.labels_
pd.DataFrame(labels, index=range(1, len(df.index) + 1), columns=['Cluster ID'])
