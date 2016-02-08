FROM ubuntu:trusty
MAINTAINER Yoni Davidson  <yonidavidson@gmail.com>


RUN apt-get update && apt-get install -y  curl \
wget \
git \
zip \
build-essential \
gcc-arm-linux-gnueabihf \
g++-arm-linux-gnueabihf \
&& apt-get clean

# Install jq
RUN curl http://stedolan.github.io/jq/download/linux64/jq > /usr/local/bin/jq && chmod a+x /usr/local/bin/jq

# Install GO and tools
RUN wget https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.5.linux-amd64.tar.gz

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
