# docker-httpd

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Run the container

Using the `docker` command:

    CONTAINER="httpddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /httpd \
      viljaste/data:dev

    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from httpddata \
      -e SERVER_NAME="localhost" \
      -d \
      viljaste/httpd:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t viljaste/httpd:dev . \
      && cd -

## Logging

The Apache HTTP server error and access logs are logged to standard output, meaning that by executing `docker logs httpd` command, it will display the logs directly on your screen.

## Back up Apache HTTP Server data

    sudo docker run \
      --rm \
      --volumes-from httpddata \
      -v $(pwd):/backup \
      viljaste/base:dev tar czvf /backup/httpddata.tar.gz /httpd

## Restore Apache HTTP Server data from a backup

    sudo docker run \
      --rm \
      --volumes-from httpddata \
      -v $(pwd):/backup \
      viljaste/base:dev tar xzvf /backup/httpddata.tar.gz

## License

**MIT**
