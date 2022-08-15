# dgraph-builder

`dgraph-builder` facilitates building `dgraph` binary for different OS & different Commit SHA's. With this you can build
dgraph binary quickly without having to setup `Go` environment or other dependencies. All you need is `docker`!

There is also a `launcher` script which will spin up a HA cluster with ACL locally.

## PreRequisites
- Docker

## How to Build

```bash
sh dgraph-builder.sh linux master 
```

## How to Build & Launch
```bash
sh dgraph-launcher.sh master
```



