# Rails Toolbox Docker Image

This repository contains a Dockerfile to build a Rails development environment with a customizable Ruby version.

## Features

- Installs Ruby (default: `3.3`).
- Pre-installs Rails and Bundler gems.
- Configures the working directory to `/app`.

## Prerequisites

- [Docker](https://www.docker.com/) installed on your machine.

## Usage

### 1. Build the Docker Image

You can customize the Ruby version using the `--build-arg` flag. The default Ruby version is `3.3`.

#### Command

```bash
docker build --build-arg RUBY_VERSION=<desired_ruby_version> -t dockerails -f Dockerfile.rails .
```

#### Example

```bash
docker build --build-arg RUBY_VERSION=3.2 -t dockerails -f Dockerfile.rails .
```

### 2. Run the Docker Container

Run an interactive shell in the container:

```bash
docker run --rm -it -v $(pwd):/app -w /app dockerails
```

This command:

- Mounts the current directory (`$(pwd)`) to `/app` in the container.
- Sets `/app` as the working directory.

### 3. Verify Rails Installation

Once inside the container, you can verify the Rails installation:

```bash
rails --version
```

### 4. Start a New Rails Project

Inside the container, you can create a new Rails application:

```bash
docker run -it -v $PWD:/app dockerails rails new rails_new --database=postgresql
```

## Notes

- The container is designed to exit once the command completes, as it uses the `--rm` flag.
- Make sure to mount your project directory to `/app` to preserve files.

## License

This project is licensed under the MIT License.
