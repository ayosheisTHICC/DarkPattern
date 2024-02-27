import pandas as pd 
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.naive_bayes import BernoulliNB
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from joblib import dump
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns

df1 = pd.read_csv("C:\\Users\\Anuku\\OneDrive\\Desktop\\DarkWebPattern-Sharktooth\\AI Model\\Trained Models\\normie.csv")
df2 = pd.read_csv("C:\\Users\\Anuku\\OneDrive\\Desktop\\DarkWebPattern-Sharktooth\\AI Model\\Trained Models\\dark_patterns.csv")

df1 = df1[pd.notnull(df1["Pattern String"])]
df1 = df1[df1["classification"] == 0]
df1["classification"] = "Not Dark"
df1.drop_duplicates(subset="Pattern String")

df2 = df2[pd.notnull(df2["Pattern String"])]
df2["classification"] = "Dark"
col = ["Pattern String", "classification"]
df2 = df2[col]

df = pd.concat([df1, df2])

X_train, X_test, y_train, y_test = train_test_split(
    df['Pattern String'], df["classification"], train_size=.25, random_state=42)

# Naive Bayes Classifier
count_vect = CountVectorizer()
X_train_counts = count_vect.fit_transform(X_train)
tfidf_transformer = TfidfTransformer()
X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

clf_nb = BernoulliNB().fit(X_train_tfidf, y_train)

y_pred_nb = clf_nb.predict(count_vect.transform(X_test))

# Random Forest Classifier
clf_rf = RandomForestClassifier(n_estimators=100, random_state=42)
X_train_counts_rf = count_vect.fit_transform(X_train)
X_train_tfidf_rf = tfidf_transformer.fit_transform(X_train_counts_rf)
clf_rf.fit(X_train_tfidf_rf, y_train)

y_pred_rf = clf_rf.predict(count_vect.transform(X_test))

# Evaluate and compare accuracies
accuracy_nb = metrics.accuracy_score(y_pred_nb, y_test)
accuracy_rf = metrics.accuracy_score(y_pred_rf, y_test)

print("Naive Bayes Accuracy: ", accuracy_nb)
print("Random Forest Accuracy: ", accuracy_rf)

# Confusion Matrix for Naive Bayes
conf_matrix_nb = confusion_matrix(y_test, y_pred_nb)
print("Confusion Matrix - Naive Bayes:\n", conf_matrix_nb)

# Confusion Matrix for Random Forest
conf_matrix_rf = confusion_matrix(y_test, y_pred_rf)
print("Confusion Matrix - Random Forest:\n", conf_matrix_rf)

# Visualize Confusion Matrix for Naive Bayes
plt.figure(figsize=(8, 6))
plt.title("Confusion Matrix - Naive Bayes")
sns.heatmap(conf_matrix_nb, annot=True, fmt="d", cmap="Blues", cbar=False,
            xticklabels=["Dark", "Not Dark"], yticklabels=["Dark", "Not Dark"])
plt.xlabel("Predicted")
plt.ylabel("True")
plt.show()

# Visualize Confusion Matrix for Random Forest
plt.figure(figsize=(8, 6))
plt.title("Confusion Matrix - Random Forest")
sns.heatmap(conf_matrix_rf, annot=True, fmt="d", cmap="Blues", cbar=False,
            xticklabels=["Dark", "Not Dark"], yticklabels=["Dark", "Not Dark"])
plt.xlabel("Predicted")
plt.ylabel("True")
plt.show()

# Save the Random Forest model and CountVectorizer
dump(clf_rf, 'random_forest_classifier.joblib')
dump(count_vect, 'random_forest_vectorizer.joblib')
