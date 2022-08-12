FROM ubuntu:latest
MAINTAINER Sudhish "sudhish@dgraph.io"
COPY . /
RUN apt-get update -y
RUN apt-get install -y curl
RUN apt-get install -y make
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get install -y golang-go
RUN apt-get install -y git
WORKDIR "/src"
CMD sleep infinity