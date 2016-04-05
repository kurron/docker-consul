#!/bin/bash

CMD="docker run \
       --detach \
       --restart always \
       --net "host" \
       --name "consul" \
       kurron/docker-consul:0.6.4 agent -data-dir /tmp -dc nashua -server -retry-join-wan 10.0.2.200 -retry-join-wan 10.0.0.200 -retry-join-wan 10.0.4.200 -bootstrap-expect 1 -node utilite1 -ui -bind 192.168.254.90"

echo eval $CMD
eval $CMD $*
