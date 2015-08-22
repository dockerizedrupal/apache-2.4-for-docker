FROM dockerizedrupal/base:debian-jessie

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/httpd"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/src/entrypoint.sh", "run"]
