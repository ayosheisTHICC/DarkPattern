import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import Tokenizer
from sklearn.metrics import accuracy_score, classification_report
from sklearn.preprocessing import LabelEncoder
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Embedding, LSTM, SpatialDropout1D
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.metrics import Accuracy

# Assuming you have a DataFrame with 'text' and 'dark_pattern_type' columns
# ...

# Label encoding for different types of dark patterns
label_encoder = LabelEncoder()
df['label_encoded'] = label_encoder.fit_transform(df['dark_pattern_type'])

tokenizer = Tokenizer(num_words=10000, oov_token='<OOV>')
tokenizer.fit_on_texts(df['text'])
sequences = tokenizer.texts_to_sequences(df['text'])
padded_sequences = pad_sequences(sequences, maxlen=100, padding='post', truncating='post')

X_train, X_test, y_train, y_test = train_test_split(padded_sequences, df['label_encoded'], test_size=0.2, random_state=42)

model = Sequential()
model.add(Embedding(input_dim=10000, output_dim=64, input_length=100))
model.add(SpatialDropout1D(0.2))
model.add(LSTM(100))
model.add(Dense(128, activation='relu'))
model.add(Dense(64, activation='relu'))
model.add(Dense(len(df['dark_pattern_type'].unique()), activation='softmax'))  # Softmax for multi-class classification

model.compile(loss='sparse_categorical_crossentropy', optimizer=Adam(), metrics=[Accuracy()])

model.fit(X_train, y_train, epochs=10, batch_size=32, validation_split=0.2)

y_pred = np.argmax(model.predict(X_test), axis=-1)
accuracy = accuracy_score(y_test, y_pred)
print(f"Test Accuracy: {accuracy * 100:.2f}%")

print(classification_report(y_test, y_pred, target_names=label_encoder.classes_))
