# Nome da imagem Docker
IMAGE_NAME = iris-model

GREEN = "\033[32;1m"
RED = "\033[31;1m"
CYAN = "\033[36;1m"
WHITE = "\033[37;1;4m"
COLOR_LIMITER = "\033[0m"

all: build run

# Alvo padrão para construir a imagem
build:
	docker build -t $(IMAGE_NAME) .
	@echo $(CYAN)" ---------------------------------------"$(COLOR_LIMITER)
	@echo $(CYAN)"| Docker build completed successfully!! |"$(COLOR_LIMITER)
	@echo $(CYAN)" --------------------------------------- "$(COLOR_LIMITER)

# Alvo para rodar o contêiner
run:
	docker-compose up --build
	@echo $(CYAN)" --------------------------------------- "$(COLOR_LIMITER)
	@echo $(CYAN)"|  Docker run completed successfully!!  |"$(COLOR_LIMITER)
	@echo $(CYAN)" --------------------------------------- "$(COLOR_LIMITER)

test:
	python3 -m unittest discover -s tests

# Alvo para parar e remover o contêiner
clean:
	docker stop $(IMAGE_NAME)-container || true
	docker rm $(IMAGE_NAME)-container || true
	docker rmi $(IMAGE_NAME) || true
	docker-compose down --rmi all

.PHONY: build run test clean
