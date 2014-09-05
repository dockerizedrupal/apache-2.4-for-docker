docker-apache-2.2.22
====================

Run the container

    APACHE_DOCUMENT_ROOT=/var/www
    APACHE_SERVERNAME=example.com

    sudo docker run \
      --name apache \
      --net host \
      -v /opt/apache-2.2.22/conf.d:/conf.d \
      -v "${APACHE_DOCUMENT_ROOT}":/var/www \
      -e APACHE_SERVERNAME="${APACHE_SERVERNAME}" \
      -d \
      simpledrupalcloud/apache:2.2.22

Build the image yourself
------------------------

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-apache.git docker-apache
    cd docker-apache
    git checkout 2.2.22
    sudo docker build -t apache:2.2.22 .