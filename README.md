# Docker GitHub Pages

[![Docker Builds](https://github.com/naoigcat/docker-rubocop/actions/workflows/push.yml/badge.svg)](https://github.com/naoigcat/docker-rubocop/actions/workflows/push.yml)

[![GitHub Stars](https://img.shields.io/github/stars/naoigcat/docker-rubocop.svg)](https://github.com/naoigcat/docker-rubocop/stargazers)
[![Docker Pulls](https://img.shields.io/docker/pulls/naoigcat/rubocop)](https://hub.docker.com/r/naoigcat/rubocop)

**Docker Image for [RuboCop](https://rubocop.org)'s Gem**

## Installation

```sh
docker pull naoigcat/rubocop
```

## Usage

```sh
docker run --rm -v ${PWD}:/app naoigcat/rubocop
```

## Building with SSL Proxy Support

**GitHub Actions**: The workflow automatically creates the `ca-certs` directory with system CA certificates before building.

**Local builds**: If you're building in an environment with SSL interception (e.g., corporate proxy, mkcert), create a `ca-certs` directory with your CA certificates before building:

```sh
mkdir -p ca-certs
cp /usr/local/share/ca-certificates/*.crt ca-certs/
docker build -t naoigcat/rubocop .
```

The `ca-certs` directory is gitignored and created as needed.
