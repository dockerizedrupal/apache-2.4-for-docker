# docker-httpd

A [Docker](https://docker.com/) image for [Apache HTTP Server](http://httpd.apache.org/).

## Run the container

Using the `docker` command:

    CONTAINER="httpddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /httpd \
      dockerizedrupal/data:latest

    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from httpddata \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e INDEXES="Off" \
      -e USER_ID="" \
      -e GROUP_ID="" \
      -d \
      dockerizedrupal/httpd:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t dockerizedrupal/httpd:latest . \
      && cd -

## License

**MIT**
