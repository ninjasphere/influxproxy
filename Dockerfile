FROM ubuntu:14.04
MAINTAINER jon@ninjablocks.com

RUN apt-get -y update && apt-get install -y nginx
EXPOSE 8087