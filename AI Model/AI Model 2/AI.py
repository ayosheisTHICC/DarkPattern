import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics import accuracy_score, classification_report
from sklearn.preprocessing import LabelEncoder
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Embedding, LSTM, SpatialDropout1D
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences


data = {
    'text': ["This website has clear and honest design.", "This website tricks users into unwanted actions.",
             "Another website with honest design.", "A deceptive website with misleading elements."],
    'label': ["Not Dark Pattern", "Dark Pattern", "Not Dark Pattern", "Dark Pattern"]
}

df = pd.DataFrame(data)

label_encoder = LabelEncoder()
df['label_encoded'] = label_encoder.fit_transform(df['label'])


vectorizer = TfidfVectorizer(max_features=1000, stop_words='english')
X = vectorizer.fit_transform(df['text']).toarray()

X_train, X_test, y_train, y_test = train_test_split(X, df['label_encoded'], test_size=0.2, random_state=42)


model = Sequential()
model.add(Dense(128, input_dim=X_train.shape[1], activation='relu'))
model.add(Dense(64, activation='relu'))
model.add(Dense(1, activation='sigmoid'))


model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])


model.fit(X_train, y_train, epochs=10, batch_size=32, validation_split=0.2)

y_pred = model.predict_classes(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Test Accuracy: {accuracy * 100:.2f}%")


print(classification_report(y_test, y_pred))
