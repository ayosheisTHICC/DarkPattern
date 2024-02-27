import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
import keras.models
from keras.models import Model
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout, Input
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.utils import to_categorical


file_path = '/content/dataset.tsv'
data = pd.read_csv(file_path, delimiter='\t')


text_data = data['text'].values
labels = data['label'].values
pattern_categories = data['Pattern Category'].values


label_encoder = LabelEncoder()
labels = label_encoder.fit_transform(labels)
num_classes_label = len(label_encoder.classes_)

# One-hot encode Pattern Categories
pattern_category_encoder = LabelEncoder()
pattern_categories_encoded = pattern_category_encoder.fit_transform(pattern_categories)
pattern_categories_onehot = to_categorical(pattern_categories_encoded)
num_classes_pattern = len(pattern_category_encoder.classes_)


text_train, text_test, labels_train, labels_test, pattern_train, pattern_test = train_test_split(
    text_data, labels, pattern_categories_onehot, test_size=0.2, random_state=42
)


max_words = 10000  # Set the maximum number of words to consider
max_len = 100  # Set the maximum sequence length
tokenizer = Tokenizer(num_words=max_words)
tokenizer.fit_on_texts(text_train)
sequences_train = tokenizer.texts_to_sequences(text_train)
sequences_test = tokenizer.texts_to_sequences(text_test)
X_train = pad_sequences(sequences_train, maxlen=max_len)
X_test = pad_sequences(sequences_test, maxlen=max_len)


input_text = Input(shape=(max_len,))
embedding_layer = Embedding(max_words, 64, input_length=max_len)(input_text)
lstm_layer = LSTM(128)(embedding_layer)
dropout_layer = Dropout(0.5)(lstm_layer)


label_dense_layer = Dense(64, activation='relu')(dropout_layer)
label_output_layer = Dense(num_classes_label, activation='softmax', name='label')(label_dense_layer)


pattern_dense_layer = Dense(64, activation='relu')(dropout_layer)
pattern_output_layer = Dense(num_classes_pattern, activation='softmax', name='pattern_category')(pattern_dense_layer)


model = Model(inputs=input_text, outputs=[label_output_layer, pattern_output_layer])

# Compile the model
model.compile(optimizer='adam',
              loss={'label': 'sparse_categorical_crossentropy', 'pattern_category': 'categorical_crossentropy'},
              metrics={'label': 'accuracy', 'pattern_category': 'accuracy'})

# Train the model
model.fit(X_train, {'label': labels_train, 'pattern_category': pattern_train},
          epochs=10, batch_size=32, validation_data=(X_test, {'label': labels_test, 'pattern_category': pattern_test}))

# Evaluate the model
result = model.evaluate(X_test, {'label': labels_test, 'pattern_category': pattern_test})
print(f"Test Loss: {result[0]}")
print(f"Label Test Accuracy: {result[1]}")
print(f"Pattern Category Test Accuracy: {result[2]}")


# Save the model for future use
model.save('your_multi_output_model.h5')