include .env

stop_containers:
	@echo "Stopping other docker container"
	if [ $$(docker ps -q) ]; then \
		echo "Found and stopped containers"; \
		docker stop $$(docker ps -q); \
	else \
		echo "No containers running..."; \
	fi

create_container:
	docker run --name ${DB_DOCKER_CONTAINER} -p 5433:5432 -e POSTGRES_USER=${USER} -e POSTGRES_PASSWORD=${PASSWORD} -d postgres:17-alpine

create_db:
	docker exec -it ${DB_DOCKER_CONTAINER} createdb --username=${USER} --owner=${USER} ${DB_NAME}

start_container:
	docker start ${DB_DOCKER_CONTAINER}

stop_container:
	docker stop ${DB_DOCKER_CONTAINER}

remove_container:
	docker rm ${DB_DOCKER_CONTAINER}

create_migration:
	sqlx migrate add -r init

migrate_up:
	sqlx migrate run --database-url "postgres://${USER}:${PASSWORD}@${HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"

migrate_down:
	sqlx migrate revert --database-url "postgres://${USER}:${PASSWORD}@${HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"

build:
	if [ -f "${BINARY}" ]; then \
		rm ${BINARY}; \
		echo "Deleted ${BINARY}"; \
	fi	
	@echo "Building binary..."
	go build -o ${BINARY} cmd/server/*.go

run: build
	./${BINARY}
	@echo "server running..."
	
stop:
	@echo "stopping server..."
	@-pkill -SIGTERM -f "./${BINARY}"
	@echo "server stopped..."

.PHONY: stop_containers create_container create_db start_container stop_container remove_container create_migration migrate_up migrate_down build run stop