#!/bin/bash

export COMMIT=$1

if [ -z "$COMMIT" ]
then
      echo "no COMMIT is entered, choosing master"
      export COMMIT="master"
else
      echo "Building for commit $COMMIT"
fi

sh dgraph-builder.sh linux $COMMIT
cp /tmp/dgraph-builder/dgraph ~/go/bin/dgraph
cp hmac_secret_file /tmp/dgraph-builder/hmac_secret_file

docker-compose up
