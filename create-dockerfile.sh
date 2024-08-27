#!/bin/sh

# Create Dockerfile

# Assign the filename to a variable
DOCKERFILE_NAME="Dockerfile.dev"

cat <<EOL > $DOCKERFILE_NAME
FROM ruby:3.2.3
WORKDIR /usr/src/app
EOL
# Confirm the file was created and display its contents
echo "$DOCKERFILE_NAME created:"

# Create docker-compose.yml

cat <<EOL > docker-compose.yml
services:
  web:
    build:
      context: ./
      dockerfile: $DOCKERFILE_NAME
    ports:
      - "3000:3000"
    volumes:
      - .:/usr/src/app
EOL
# Confirm the file was created and display its contents
echo "docker-compose.yml created:"