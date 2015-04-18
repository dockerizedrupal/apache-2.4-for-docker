# docker-httpd

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Run the container

Using the `docker` command:

    CONTAINER="httpddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /httpd \
      viljaste/data:latest

    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from httpddata \
      -e SERVER_NAME="localhost" \
      -d \
      viljaste/httpd:latest

Using the `docker-composer` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-composer up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/httpd:latest . \
      && cd -

## License

**MIT**
