# Pull base image
FROM python:3.7-slim

# Install system packages
RUN apt-get update && \
    apt-get upgrade -y && \
    pip install pipenv

# Build arguments
ARG PIPENV_FLAGS

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY ./Pipfile.lock ./Pipfile ./
RUN pipenv install ${PIPENV_FLAGS}

# Copy project
COPY . .
