import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from tensorflow.keras.models import Sequential, load_model
from tensorflow.keras.layers import Dense, Embedding, Flatten, Dropout


data = pd.read_csv('allRecipes_users_data.csv', sep=';')

X = data[['username', 'recipe_id']]
y = data['rating']


encoder = OneHotEncoder(sparse_output=False, handle_unknown='ignore')
X_encoded = encoder.fit_transform(X[['recipe_id', 'username']])
X_encoded = pd.DataFrame(X_encoded, columns=encoder.get_feature_names_out(['recipe_id', 'username']))
X = pd.concat([X_encoded, X.drop(['recipe_id', 'username'], axis=1)], axis=1)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)


def create_model(hidden_layer_sizes=(64,), activation='relu', optimizer='adam', dropout_rate=0.0):
    model = Sequential()
    
    # Add embeddings for 'recipe_id' and 'username'
    model.add(Embedding(input_dim=len(X_encoded.columns), output_dim=8, input_length=X_train_scaled.shape[1]))
    model.add(Flatten())
    
    # Add additional hidden layers if applicable
    for units in hidden_layer_sizes:
        model.add(Dense(units, activation=activation))
        model.add(Dropout(dropout_rate))  # Add dropout for regularization
    
    model.add(Dense(1))  # Output layer for regression task
    model.compile(loss='mean_squared_error', optimizer=optimizer)
    return model

'''
myModel = create_model((64,), 'tanh', 'adam', 0.5)

myModel.fit(X_train_scaled, y_train, epochs = 20)

myModel.save('myModel.h5')
'''


myModel = load_model('myModel.h5')

# Prédiction pour de nouvelles données
new_data = pd.DataFrame({'username': ['arthur'], 'recipe_id': ['b7526c6b-560b-4000-a4da-9112bcaa657a']})
new_data_encoded = encoder.transform(new_data[['recipe_id', 'username']])
new_data_encoded = pd.DataFrame(new_data_encoded, columns=encoder.get_feature_names_out(['recipe_id', 'username']))
new_data_processed = pd.concat([new_data_encoded, new_data.drop(['recipe_id', 'username'], axis=1)], axis=1)
new_data_scaled = scaler.transform(new_data_processed)

# Prédiction
prediction = myModel.predict(new_data_scaled)
print("Prediction for user 'arthur' and recipe 'b7526c6b-560b-4000-a4da-9112bcaa657a':", prediction[0, 0])
