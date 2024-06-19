# Dockerfile
FROM python:3.10.4

# Copiar arquivos necessários
COPY requirements.txt /app/requirements.txt
COPY mlserver.yaml /app/mlserver.yaml
COPY model /app/model

WORKDIR /app

# Instalar dependências
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Comando para iniciar o MLServer
CMD ["mlserver", "start", "."]
