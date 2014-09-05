#!/usr/bin/env bash

sudo docker run \
  --name apache \
  --net host \
  -v /opt/apache-2.2.22/conf.d:/conf.d \
  -v "${APACHE_DOCUMENT_ROOT}":/var/www \
  -e APACHE_SERVERNAME="${APACHE_SERVERNAME}" \
  -d \
  simpledrupalcloud/apache:2.2.22
