#!/bin/bash

CMD="docker run \
       --detach \
       --restart always \
       --net "host" \
       --name "consul" \
       kurron/docker-consul:0.6.4 agent -data-dir /tmp -dc basement -server -retry-join-wan 54.186.179.52 -retry-join-wan 54.200.121.152 -retry-join-wan 54.187.136.98 -node be-unique -ui -bind 10.0.2.15"

#echo $CMD
eval $CMD $*
