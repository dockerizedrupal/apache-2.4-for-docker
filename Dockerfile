FROM simpledrupalcloud/base

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN chmod +x /src/build.sh
RUN /src/build.sh

RUN rm -rf /tmp/*

VOLUME ["/apache-2.2.22/conf.d"]
VOLUME ["/apache-2.2.22/data"]
VOLUME ["/apache-2.2.22/log"]

EXPOSE 80

ENTRYPOINT ["/src/run.sh"]
