#!/bin/bash

# check for docker
docker build -t dgraph-builder /Users/sudhishkr/scratch/github/skrdgraph/dgraph-builder
docker run --name="dgraph-builder" -v /tmp/dgraph-builder:/dgraph-builder -it dgraph-builder  &>/dev/null &
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "git clone https://github.com/dgraph-io/dgraph.git"
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "cd dgraph; git checkout b17395d; make install; cp /root/go/bin/dgraph /dgraph-builder/dgraph"
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "cd dgraph; git checkout b17395d; make install; cp /root/go/bin/dgraph /dgraph-builder/dgraph"
docker stop $(docker ps -aq --filter 'name=dgraph-builder')
docker rm $(docker ps -aq --filter 'name=dgraph-builder')