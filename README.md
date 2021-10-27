
# Docker Image with Debian 11 base image 

This repo was created in order to test ansible roles with molecule.

## Build it locally

  docker build - < Dockerfile_$VERSION

## Use it from dockerhub

    https://hub.docker.com/repository/docker/lotusnoir/ansible_molecule_test_images:debian11


This repo was build from a gitlab repo first in order to be build in CI/CD
To build this image and have it available on your company gitlab registry for the CI/CD builds, you need to follow this steps:

On gitlab > Settings > repository > deploy token

Create new with username CI, select all scopes

On gitlab > Settings > CI/CD > variables > add variable

CI_BUILD_TOKEN with previous token code
