FROM simpledrupalcloud/base-image

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./build /tmp/build

RUN chmod +x /tmp/build/build.sh
RUN /tmp/build/build.sh
RUN rm -rf /tmp/*

VOLUME ["/var/www"]

EXPOSE 80

ENTRYPOINT ["/run.sh"]