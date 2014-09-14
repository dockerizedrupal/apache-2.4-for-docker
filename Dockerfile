FROM simpledrupalcloud/base

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./build /tmp/build

RUN chmod +x /tmp/build/build.sh
RUN /tmp/build/build.sh
RUN rm -rf /tmp/*

VOLUME ["/apache-2.2.22/conf.d"]
VOLUME ["/apache-2.2.22/data"]
VOLUME ["/apache-2.2.22/log"]

EXPOSE 80

ENTRYPOINT ["/run.sh"]