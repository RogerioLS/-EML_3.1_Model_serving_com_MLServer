### *Projeto de Classificação de Flores Iris com MLServer*

Este projeto demonstra como treinar um modelo de classificação utilizando o conjunto de dados Iris e servir esse modelo usando o MLServer. O modelo treinado é um classificador RandomForestClassifier do scikit-learn, e é servido através do MLServer para inferência.

Pré-requisitos
Docker instalado na máquina local
Conhecimento básico de linha de comando
Passos para Execução
1. Clonar o Repositório
Clone este repositório para sua máquina local:

```
git clone https://github.com/seu-usuario/iris-classification-mlserver.git
cd iris-classification-mlserver
```
2. Treinar o Modelo
Dentro do diretório do projeto, execute o script de treinamento para treinar o modelo e gerar o arquivo .pkl:

```
python train_model.py
```

Este script utiliza o conjunto de dados Iris, treina um RandomForestClassifier e salva o modelo treinado como model/iris-model/iris_model.pkl.

3. Construir e Executar o Contêiner Docker
Utilize o Makefile fornecido para construir e executar o contêiner Docker que servirá o modelo:

````
make build
make run
````
O comando make build construirá a imagem Docker com base no Dockerfile fornecido. O comando make run iniciará o contêiner Docker em segundo plano.

4. Verificar o Status do Contêiner
Verifique se o contêiner está em execução e sem erros. Você pode verificar o status usando o seguinte comando:

````
make
````
Certifique-se de que o contêiner iris-model está listado e em execução.


5. Executar Solicitações de Inferência
Você pode enviar solicitações de inferência para o modelo servido pelo MLServer usando qualquer cliente HTTP. Aqui está um exemplo simples usando curl:

```
python send_prediction.py
```

6. Parar e Limpar o Ambiente
Para parar o contêiner e limpar o ambiente:

````
make clean
````