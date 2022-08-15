FROM ubuntu:latest
MAINTAINER Sudhish "sudhish@dgraph.io"
COPY . /
RUN apt-get update -y
RUN apt-get install -y libc6 libc-bin
RUN apt-get install -y protobuf-compiler
RUN apt-get install -y curl
RUN apt-get install -y make
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get install -y golang-go
WORKDIR "/src"
CMD sleep infinity