#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to display error messages and exit
error_exit() {
    echo -e "${RED}Error: $1${NC}" >&2
    exit 1
}

# Function to display success messages in green
success_message() {
    echo -e "${GREEN}$1${NC}"
}

# Function to create Dockerfile
create_dockerfile() {
    local dockerfile="Dockerfile.dev"
    cat <<EOL > "$dockerfile"
FROM ruby:3.2.3
WORKDIR /usr/src/app
COPY . .
RUN bundle install
EOL
    success_message "$dockerfile created successfully."
}

# Function to create docker-compose.yml
create_docker_compose() {
    local dockerfile="Dockerfile.dev"
    cat <<EOL > docker-compose.yml
services:
  web:
    build:
      context: ./
      dockerfile: $dockerfile
    ports:
      - "3000:3000"
    volumes:
      - .:/usr/src/app
    command: rails s -b 0.0.0.0
EOL
    success_message "docker-compose.yml created successfully."
}

# Function to check if Docker is running
check_docker() {
    docker info > /dev/null 2>&1 || error_exit "Docker daemon is not running."
}

# Main execution
main() {
    
    check_docker

    # Prompt for app name
    read -p "Enter the name of your Rails application: " APP_NAME
    [ -z "$APP_NAME" ] && error_exit "Application name cannot be empty."

    # Create and enter app directory
    TARGET_DIR="$APP_NAME"
    rm -rf "$TARGET_DIR"
    mkdir -p "$TARGET_DIR" || error_exit "Failed to create directory $TARGET_DIR"
    cd "$TARGET_DIR" || error_exit "Failed to enter directory $TARGET_DIR"

    create_dockerfile
    create_docker_compose

    echo "Setting up Rails application..."
    docker-compose run --rm web bash -c "
        gem install rails &&
        rails new ./ --name=$APP_NAME &&
        bundle install
    " || error_exit "Failed to set up Rails application."

    echo "Building Docker image..."
    docker-compose build || error_exit "Docker build failed."

    echo "Starting the application..."
    docker-compose up
}

# Run the main function
main