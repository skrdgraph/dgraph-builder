#!/bin/bash

sh dgraph-builder.sh linux 15d3701
cp /tmp/dgraph-builder/dgraph ~/go/bin/dgraph
cp hmac_secret_file /tmp/dgraph-builder/hmac_secret_file

docker-compose up