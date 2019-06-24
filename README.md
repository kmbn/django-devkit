# django-devkit
Develop and test Django applications in a portable containerized development environment.

The app files are available locally and you can edit them with the editor of your choice. All the commands are run in a container. You do not need to install Python or any of the dependencies locally.

Django-devkit uses Python 3.7 and Django 2.2.2 by default.

Postgres is included via docker-compose.

## Requirements
Docker and docker-compose are required. Docker must be running. Make is not required (you can run all the Docker and docker-commands without it); it is only required for easily using the shortcuts described below.

## Get started
```shell
make build
```
This will build the necessary container(s).

## Run tests
```shell
make test
```

## Lint code
```shell
make lint
```

## Generate test coverage report
```shell
make coverage
```

## Run the app locally for development
```shell
make up
```

To stop the app:
```shell
make down
```

## View logs
```shell
make logs
```

## Django commands
createsuperuser:
```shell
make createsuperuser
```

makemigrations:
```shell
make makemigrations APP=<name of app>
```

migrate:
```shell
make migrate
```

shell:
```shell
make shell
```

startproject:
```shell
make startproject PROJECT=<name of project> .
```

startapp:
```shell
make startapp APP=<name of app>
```

# Pipenv commands
install:
```shell
make install PKG=<name of package (optionally==version)>
```

install --dev:
```shell
make installdev PKG=<name of package (optionally==version)>
```

uninstall:
```shell
make uninstall PKG=<name of package>
```

