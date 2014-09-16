docker-apache-2.2.22
====================

Run the container
-----------------

    CONTAINER=apache && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      -v /var/apache-2.2.22/conf.d:/apache-2.2.22/conf.d \
      -v /var/apache-2.2.22/data:/apache-2.2.22/data \
      -v /var/apache-2.2.22/log:/apache-2.2.22/log \
      -e APACHE_SERVERNAME=example.com \
      -d \
      simpledrupalcloud/apache:2.2.22

Build the image
---------------

    TMP=$(mktemp -d) \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-apache.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22 \
      && sudo docker build -t simpledrupalcloud/apache:2.2.22 . \
      && cd -