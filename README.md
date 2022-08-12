# dgraph-builder

`dgraph-builder` facilitates building `dgraph` binary for different OS & different Commit SHA's. With this you can build
dgraph binary quickly without having to setup `Go` environment or other dependencies. All you need is `docker`.

## PreRequisites
- Docker

## How to Build

```bash
sh dgraph-builder.sh linux b17395d # this will build for v21.03.2
```

