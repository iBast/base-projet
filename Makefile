console:
	docker exec -it www_docker_symfony bash

install:
	docker-compose build
	docker exec www_docker_symfony composer create-project symfony/website-skeleton "6.1.*" project

start:
	docker-compose up -d
	@echo "Sf at http://127.0.0.1:8080/"
	@echo "PMA at http://127.0.0.1:9080/"

stop:
	docker-compose down --remove-orphans