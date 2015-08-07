FROM ubuntu:14.04
MAINTAINER jon@ninjablocks.com

RUN apt-get -y update && apt-get install -y nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.sh /templates/default.sh
ADD wrapper.sh /wrapper.sh

ENV INFLUX_HOST=influx
ENV INFLUX_URL=http://influx:8086
ENV INFLUX_USER=
ENV INFLUX_PASSWORD=

WORKDIR /etc/nginx
ENTRYPOINT /wrapper.sh
EXPOSE 18086
