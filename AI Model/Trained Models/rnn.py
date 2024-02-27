import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

file_path = '/content/dataset.tsv'
data = pd.read_csv(file_path, delimiter='\t')

text_data = data['text'].values
labels = data['label'].values

label_encoder = LabelEncoder()
labels = label_encoder.fit_transform(labels)
num_classes = len(label_encoder.classes_)


text_train, text_test, labels_train, labels_test = train_test_split(text_data, labels, test_size=0.2, random_state=42)


max_words = 10000  # Set the maximum number of words to consider
max_len = 100  # Set the maximum sequence length
tokenizer = Tokenizer(num_words=max_words)
tokenizer.fit_on_texts(text_train)
sequences_train = tokenizer.texts_to_sequences(text_train)
sequences_test = tokenizer.texts_to_sequences(text_test)
X_train = pad_sequences(sequences_train, maxlen=max_len)
X_test = pad_sequences(sequences_test, maxlen=max_len)


model = Sequential()
model.add(Embedding(max_words, 64, input_length=max_len))
model.add(LSTM(128))
model.add(Dropout(0.5))
model.add(Dense(64, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(num_classes, activation='softmax'))


model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])


model.fit(X_train, labels_train, epochs=10, batch_size=32, validation_data=(X_test, labels_test))

# Evaluate the model
accuracy = model.evaluate(X_test, labels_test)[1]
print(f"Test Accuracy: {accuracy}")

# Save the model for future use
model.save('your_text_model.h5')