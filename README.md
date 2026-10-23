# Docker Image with Debian 11 base image

This repo was created in order to test ansible roles with molecule.

## Build it locally

### Build

  docker build -t debian11img .

### Run

  docker run -d --name debian11con \
  --privileged \
  --cgroupns=host \
  --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw debian11img

### Test

  docker exec debian11con systemctl is-system-running --wait

### Explore

  docker exec -it debian11con bash

## Use it from dockerhub

    https://hub.docker.com/repository/docker/lotusnoir/ansible_molecule_test_images:debian11
