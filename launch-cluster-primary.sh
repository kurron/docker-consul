#!/bin/bash

PUBLIC_IP=192.168.44.30

# launches Consul master at port 53 and exposes the Web UI at port 8500
docker run --detach \
           --restart always \
           --publish 8300:8300 \
           --publish 8301:8301 \
           --publish 8301:8301/udp \
           --publish 8302:8302 \
           --publish 8302:8302/udp \
           --publish 8400:8400 \
           --publish 8500:8500 \
           --publish 53:53/udp \
           --hostname $HOSTNAME \
           --name consul \
           kurron/docker-consul -server -bootstrap-expect 2 -advertise $PUBLIC_IP
