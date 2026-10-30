# Docker RuboCop

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
docker run --rm -v "$PWD":/app naoigcat/rubocop
```

### Tags

This repository publishes images on tag push. Common tag formats are:

-   `${RUBOCOP_VERSION}-ruby${RUBY_VERSION}` (most reproducible)
-   `ruby${RUBY_VERSION}`

Example:

```sh
docker run --rm -v "$PWD":/app naoigcat/rubocop:1.81.0-ruby3.4
```

The version bump workflow also repairs a missing shared tag for the current
release, using the Ruby variant in the default branch's Dockerfile.

To retry a failed Docker Hub publication, run **Push to Docker Hub** on the
default branch and enter the existing Git tag, or use:

```sh
gh workflow run push.yml -f tag=1.92.1
```

Use a `-ruby` tag to retry only that variant. A shared version tag also updates
`latest`, so select the current release when repairing `latest`.
