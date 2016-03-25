#!/bin/bash

CMD="docker run \
       --rm \
       --interactive \
       --tty \
       --net "host" \
       --user=$(id -u $(whoami)):$(id -g $(whoami)) \
       --volume $HOME:/home/developer \
       --volume $(pwd):/pwd \
       kurron/docker-consul:0.6.4"

#echo $CMD
eval $CMD $*
