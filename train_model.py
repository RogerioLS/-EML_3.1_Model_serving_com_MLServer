import pickle
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier

# carregar dados iris
iris = load_iris()
X, y = iris.data, iris.target

# treinando modelo
model = RandomForestClassifier(n_estimators=100)
model.fit(X, y)

# Salva o modelo usando pickle
with open('model/iris-model/iris_model.pkl', 'wb') as f:
    pickle.dump(model, f)