.PHONY: test

COMPOSE_PROJECT_NAME=django-devkit

COMPOSE_SERVICE_NAME=django

COMPOSE_FILE=docker-compose.yml

OVERRIDE_CI_FILE=docker-compose.ci.yml

COMPOSE=docker-compose -p $(COMPOSE_PROJECT_NAME)

EXEC=docker exec -it -e "TERM=xterm-256color" $(COMPOSE_PROJECT_NAME)_$(COMPOSE_SERVICE_NAME)_1 pipenv

PIPENV_RUN=$(EXEC) run

DJANGO_ADMIN=$(PIPENV_RUN) django-admin

MANAGE=$(PIPENV_RUN) python manage.py

CI=docker-compose -p $(COMPOSE_PROJECT_NAME) -f $(COMPOSE_FILE) -f $(OVERRIDE_CI_FILE)


# Docker commands
build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f


# Lint app
lint:
	$(PIPENV_RUN) isort -rc . && \
	black . && \
	flake8 . && \
	mypy .


# Test app
test:
	$(PIPENV_RUN) ./manage.py test --noinput


# Test app and generate coverage
coverage:
	$(PIPENV_RUN) coverage run --source ./ manage.py test --noinput
	$(PIPENV_RUN) coverage report -m


# Django commands
createsuperuser:
	$(MANAGE) createsuperuser

makemigrations:
	$(MANAGE) makemigrations $(APP)

migrate:
	$(MANAGE) migrate

shell:
	$(MANAGE) shell

startproject:
	$(DJANGO_ADMIN) startproject $(PROJECT) .

startapp:
	$(MANAGE) startapp $(APP)


# Pipenv commands
install:
	$(EXEC) install $(PKG)

installdev:
	$(EXEC) install --dev $(PKG)

uninstall:
	$(EXEC) uninstall $(PKG)


# CI commands
build_ci:
	$(CI) build
