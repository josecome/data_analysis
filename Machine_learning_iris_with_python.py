# =======================================================================================================
# This is the very basic implementation of Machine Learning. In this example we use IRIS as dataset.
# If you need to seek expertise in this area you will need to understand also the data analysis applying 
# Statistics methods so that you can judge well you data. In very important to know wich variables are 
# able to optimize you results. 
# =======================================================================================================

#Import the necessary libraries
import sys
import scipy
import numpy
import matplotlib
import pandas
import sklearn
import pandas as pd
import seaborn as sns
import pickle

#Loading libraries
from pandas.plotting import scatter_matrix
from matplotlib import pyplot
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC


#Loading dataset from seaborn libray
ds = sns.load_dataset('iris')

#Loading dataset from local computer
#ds = pd.read_csv(r'Path where the CSV file is stored\iris.csv')


#Inspecting the data
#First 5 records, shape, description and class distribuition
print(ds.head())
print(ds.shape)
print(ds.describe())
print(ds.groupby('species').size())

#Run some descriptive statistics

# Box and Whisker plots
ds.plot(kind='box', subplots=True, layout=(2,2), sharex=False, sharey=False)
pyplot.show()

# histograms
ds.hist()
pyplot.show()

# scatter plot matrix
scatter_matrix(ds)
pyplot.show()

#We need to train our model with data, also we need to test and validate our model. We can split our dataset so that we can have
#data for this 3 task

#Get values to array
ary = ds.values
X = ary[:,0:4]
y = ary[:,4]

#Assign values for train, test and validation dataset
X_train, X_validation, Y_train, Y_validation = train_test_split(X, y, test_size=0.20, random_state=1, shuffle=True)

#Get algorithms to the model
mdls = []
mdls.append(('LR', LogisticRegression(solver='liblinear', multi_class='ovr')))
mdls.append(('LDA', LinearDiscriminantAnalysis()))
mdls.append(('KNN', KNeighborsClassifier()))
mdls.append(('CART', DecisionTreeClassifier()))
mdls.append(('NB', GaussianNB()))
mdls.append(('SVM', SVC(gamma='auto')))

#Evaluate each algorithms
rsts = []
nms = []
for nm, mdl in mdls:
	kfold = StratifiedKFold(n_splits=10, random_state=1, shuffle=True)
	cv_rsts = cross_val_score(mdl, X_train, Y_train, cv=kfold, scoring='accuracy')
	rsts.append(cv_rsts)
	nms.append(nm)
	print('%s: %f (%f)' % (nm, cv_rsts.mean(), cv_rsts.std()))
    
#We can see the perfomance of each algorithms so that we can choose the best one
pyplot.boxplot(rsts, labels=nms)
pyplot.title('Algorithm Comparison')
pyplot.show()

#Making prediction with SVC on validation dataset
mdl = SVC(gamma='auto')

#Fit model to the training data
mdl.fit(X_train, Y_train)

#Predicting
predictions = mdl.predict(X_validation)

#Evaluate predictions

#See the acurracy of the model
print(accuracy_score(Y_validation, predictions))

#Confusion matrix
print(confusion_matrix(Y_validation, predictions))

#Classification information
print(classification_report(Y_validation, predictions))

# save the model to disk
filename = 'finalized_model.sav'
pickle.dump(mdl, open(filename, 'wb'))


# load the model from disk
loaded_model = pickle.load(open(filename, 'rb'))

#Testing the accurracy of the model (result may vary)
result = loaded_model.score(X_test, Y_test)

#Printing result
print(result)





