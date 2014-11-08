# docker-httpd

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Apache HTTP Server 2.2.22

### Stable release

#### Run the container

    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      -v /var/httpd-2.2.22/conf.d:/httpd-2.2.22/conf.d \
      -v /var/httpd-2.2.22/data:/httpd-2.2.22/data \
      -v /var/httpd-2.2.22/log:/httpd-2.2.22/log \
      -e HTTPD_SERVERNAME=example.com \
      -d \
      simpledrupalcloud/httpd:2.2.22

#### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22 \
      && sudo docker build -t simpledrupalcloud/httpd:2.2.22 . \
      && cd -

### Development release

#### Run the container

    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --link php52:php52 \
      --link php53:php53 \
      --link php54:php54 \
      --link php55:php55 \
      --link php56:php56 \
      -v /var/httpd-2.2.22/conf.d:/httpd-2.2.22/conf.d \
      -v /var/httpd-2.2.22/data:/httpd-2.2.22/data \
      -v /var/httpd-2.2.22/log:/httpd-2.2.22/log \
      -e HTTPD_SERVERNAME="example.com" \
      -d \
      simpledrupalcloud/httpd:2.2.22-dev

#### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22-dev \
      && sudo docker build -t simpledrupalcloud/httpd:2.2.22 . \
      && cd -
