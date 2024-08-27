# Rails Docker Setup Script

## Overview

This shell script automates the setup of a new Ruby on Rails application in Docker, eliminating the need for Ruby, Rails, or related dependencies on the host machine. It streamlines the initial setup, ensuring a consistent development environment across systems.

## Features

- Creates a new Rails application without requiring Ruby on the host machine
- Sets up a Docker environment with a custom Dockerfile and docker-compose.yml
- Installs necessary gems and dependencies within the Docker container
- Builds the Docker image
- Starts the Rails server in a Docker container

## Prerequisites

- Docker
- Docker Compose
- Bash shell

## Usage

1. Save the script as `dockerails.sh` in your desired directory.

2. Make the script executable: `chmod +x dockerails.sh`

3. Run the script: `./dockerails.sh`

4. Follow the prompts to enter your Rails application name.

5. Wait for the script to complete the setup process.

## What the Script Does

1. Checks if Docker is running
2. Prompts for the Rails application name
3. Creates a new directory for the application
4. Generates a `Dockerfile.dev` for the Rails environment
5. Creates a `docker-compose.yml` file
6. Uses Docker to install Rails and create a new Rails application
7. Builds the Docker image
8. Starts the Rails server in a Docker container

## Color-Coded Output

- Success messages are displayed in green
- Error messages are displayed in red
- Other messages use the default terminal color

## Error Handling

The script includes error handling to catch and display issues that may occur during the setup process. If an error occurs, the script will display a red error message and exit.

## Customization

You can modify the script to adjust various settings:

- Ruby version in the Dockerfile
- Port mappings in docker-compose.yml
- Additional gems or dependencies

## Contributing

Feel free to fork this project and submit pull requests with any enhancements.

## License

[MIT License](https://opensource.org/licenses/MIT)

## Support

For issues or questions, please open an issue in the GitHub repository.