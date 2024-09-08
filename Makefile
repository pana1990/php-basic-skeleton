UID=$(shell id -u)
GID=$(shell id -g)
DOCKER_PHP_SERVICE=php

start: erase cache-folders build composer-install bash

erase:
	@docker compose down -v

build:
	@docker compose build && \
	docker compose pull

cache-folders:
	@mkdir -p ~/.composer && chown ${UID}:${GID} ~/.composer

composer-install:
	@docker compose run --rm -u ${UID}:${GID} ${DOCKER_PHP_SERVICE} composer install

bash:
	@docker compose run --rm -u ${UID}:${GID} ${DOCKER_PHP_SERVICE} bash

logs:
	@docker compose logs -f ${DOCKER_PHP_SERVICE}

.PHONY: tests
tests:
	@docker compose run --rm -u ${UID}:${GID} ${DOCKER_PHP_SERVICE} composer tests

lint:
	@docker compose run --rm -u ${UID}:${GID} ${DOCKER_PHP_SERVICE} composer lint

lint-fix:
	@docker compose run --rm -u ${UID}:${GID} ${DOCKER_PHP_SERVICE} composer lint:fix

static-analysis:
	@docker compose run --rm -u ${UID}:${GID} ${DOCKER_PHP_SERVICE} composer static-analysis

all: lint static-analysis tests
