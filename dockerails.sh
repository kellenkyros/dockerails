#!/bin/sh

# Define the directory to clean (current directory by default)
TARGET_DIR="."

# Find and delete all files and directories except those with a .sh extension
find "$TARGET_DIR" -type f ! -name "*.sh" -exec rm -f {} +
find "$TARGET_DIR" -type d ! -name "*.sh" ! -name "." -exec rm -rf {} +

# ./create-dockerfile.sh

# if docker info > /dev/null 2>&1; then
#   # Prompt the user for the Rails application name
#   echo "Enter the name of your Rails application:"
#   read APP_NAME
#   # Run Docker Compose to start the web service with a bash command, install Rails, and create a new Rails application
#   docker-compose run --service-ports web bash -c "
#     gem install rails &&
#     rails new ./ --name=$APP_NAME
#   "
# else
#     echo "Docker daemon is not running."
# fi

# # Append new lines to the end of the file
# echo "COPY . ." >> "Dockerfile.dev"
# echo "RUN bundle install" >> "Dockerfile.dev"


# # Append new lines to the end of the file
# echo "COPY . ." >> "Dockerfile.dev"
# echo "RUN bundle install" >> "Dockerfile.dev"

# awk '/web:/{print;print "    command: rails s -b 0.0.0.0";next}1' "docker-compose.yml" > temp_file && mv temp_file "docker-compose.yml"

# echo "Added ${NEW_ATTRIBUTE} with value ${NEW_VALUE} under services.web in ${YAML_FILE}."

# docker-compose build

# docker-compose up