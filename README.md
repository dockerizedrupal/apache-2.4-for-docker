docker-apache-2.2.22
====================

Run the container

    sudo docker run \
      --name apache \
      --net host \
      -v /var/apache-2.2.22/conf.d:/apache-2.2.22/conf.d \
      -v /var/apache-2.2.22/data:/apache-2.2.22/data \
      -e APACHE_SERVERNAME=example.com \
      -d \
      simpledrupalcloud/apache:2.2.22

Build the image yourself
------------------------

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-apache.git docker-apache
    cd docker-apache
    git checkout 2.2.22
    sudo docker build -t apache:2.2.22 .