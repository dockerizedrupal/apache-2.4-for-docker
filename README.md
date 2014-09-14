docker-apache-2.2.22
====================

Run the container
-----------------

    sudo docker run \
      --name apache \
      -p 127.0.0.1::22 \
      -p 0.0.0.0:80:80 \
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