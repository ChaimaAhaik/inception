COMPOSE=docker compose -f srcs/docker-compose.yml

all:  build up

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

clean:
	$(COMPOSE) down -v
	docker system prune -a --volumes -f

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

start:
	$(COMPOSE) start

logs:
	$(COMPOSE) logs -f

re: down build up