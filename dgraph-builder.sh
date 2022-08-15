#!/bin/bash

export GOOS=$1
export COMMIT=$2

if [ $GOOS == "linux" ]
then
        echo "Building for 'linux'"
        #export BINARY_PATH="/root/go/bin/dgraph"
elif [ $GOOS == "darwin" ]
then
        echo "Building for 'darwin'"
        #export BINARY_PATH="/root/go/bin/darwin_amd64/dgraph"
elif [ $GOOS == "windows" ]
then
        echo "Building for 'windows'"
        #export BINARY_PATH="/root/go/bin/windows_amd64/dgraph"
else
        echo "no GOOS is entered, exiting"
        exit 1
fi


if [ -z "$COMMIT" ]
then
      echo "no COMMIT is entered, choosing master"
      export COMMIT="master"
else
      echo "Building for commit $COMMIT"
fi

# cleanup dgraph binary
rm -rf /tmp/dgraph-builder
mkdir /tmp/dgraph-builder

# build container base
docker build -t dgraph-builder /Users/sudhishkr/scratch/github/skrdgraph/dgraph-builder

# run the container
docker run --name="dgraph-builder" --env GOOS=$GOOS -v /tmp/dgraph-builder:/dgraph-builder dgraph-builder  &>/dev/null &
sleep 3

# exec cmd into the container
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "git clone https://github.com/dgraph-io/dgraph.git"
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "CGO_ENABLED=0"
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "cd dgraph; git checkout $COMMIT; CGO_ENABLED=0 make dgraph;"
docker exec -it $(docker ps -q --filter 'name=dgraph-builder') /bin/bash -c "cp /src/dgraph/dgraph/dgraph /dgraph-builder/dgraph"

# clean up
docker stop $(docker ps -aq --filter 'name=dgraph-builder')
docker rm $(docker ps -aq --filter 'name=dgraph-builder')

# binary
echo "Binary created at /tmp/dgraph-builder/dgraph"
ls -alrt /tmp/dgraph-builder/dgraph
