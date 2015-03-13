#!/bin/bash

# launches Consul master at port 53 and exposes the Web UI at port 8500
docker run --publish 8500:8500 --publish 53:53/udp --hostname node1 kurron/docker-consul -server -bootstrap
