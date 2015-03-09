FROM simpledrupalcloud/base:latest

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/httpd"]

EXPOSE 80
EXPOSE 443

CMD ["/src/entrypoint.sh", "run"]
