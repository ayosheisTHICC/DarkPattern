import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.naive_bayes import MultinomialNB
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from joblib import dump
from sklearn.metrics import confusion_matrix
import seaborn as sns
import matplotlib.pyplot as plt

selected_classification = "Pattern Category"

df = pd.read_csv("C:\\Users\\Anuku\\OneDrive\\Desktop\\DarkWebPattern-Sharktooth\\AI Model\\Trained Models\\dark_patterns.csv")

df = df[pd.notnull(df["Pattern String"])]
col = ["Pattern String", selected_classification]
df = df[col]

df["category_id"] = df[selected_classification].factorize()[0]
category_id_df = df[[selected_classification, 'category_id']
                    ].drop_duplicates().sort_values('category_id')
category_to_id = dict(category_id_df.values)
id_to_category = dict(
    category_id_df[['category_id', selected_classification]].values)

tfidf = TfidfVectorizer(sublinear_tf=True, min_df=5, norm='l2',
                        encoding='latin-1', ngram_range=(1, 2), stop_words='english')

features = tfidf.fit_transform(df["Pattern String"]).toarray()
labels = df.category_id

X_train, X_test, y_train, y_test = train_test_split(
    df['Pattern String'], df[selected_classification], train_size=.3)
count_vect = CountVectorizer()
X_train_counts = count_vect.fit_transform(X_train)
tfidf_transformer = TfidfTransformer()
X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

# Naive Bayes Classifier
clf_nb = MultinomialNB().fit(X_train_tfidf, y_train)

y_pred_nb = clf_nb.predict(count_vect.transform(X_test))

# Random Forest Classifier
clf_rf = RandomForestClassifier(n_estimators=100, random_state=42)
X_train_counts_rf = count_vect.fit_transform(X_train)
X_train_tfidf_rf = tfidf_transformer.fit_transform(X_train_counts_rf)
clf_rf.fit(X_train_tfidf_rf, y_train)

y_pred_rf = clf_rf.predict(count_vect.transform(X_test))

# Calculate and print accuracies
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
            xticklabels=category_id_df[selected_classification].values, yticklabels=category_id_df[selected_classification].values)
plt.xlabel("Predicted")
plt.ylabel("True")
plt.show()

# Visualize Confusion Matrix for Random Forest
plt.figure(figsize=(8, 6))
plt.title("Confusion Matrix - Random Forest")
sns.heatmap(conf_matrix_rf, annot=True, fmt="d", cmap="Blues", cbar=False,
            xticklabels=category_id_df[selected_classification].values, yticklabels=category_id_df[selected_classification].values)
plt.xlabel("Predicted")
plt.ylabel("True")
plt.show()

# Save the models, vectorizers, and accuracies
dump(clf_nb, 'naive_bayes_classifier.joblib')
dump(clf_rf, 'random_forest_classifier.joblib')
dump(count_vect, 'classifier_vectorizer.joblib')
dump(accuracy_nb, 'naive_bayes_accuracy.joblib')
dump(accuracy_rf, 'random_forest_accuracy.joblib')
