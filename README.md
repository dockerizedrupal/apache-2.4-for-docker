# docker-apache-2.4

A [Docker](https://docker.com/) image for [Apache HTTP Server](http://httpd.apache.org/) version 2.4.

## Run the container

Using the `docker` command:

    CONTAINER="apache-2.4-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /apache-2.4 \
      dockerizedrupal/data:latest

    CONTAINER="apache-2.4" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from apache-2.4-data \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e INDEXES="Off" \
      -e USER_ID="" \
      -e GROUP_ID="" \
      -d \
      dockerizedrupal/apache-2.4:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-apache-2.4.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-apache-2.4.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t dockerizedrupal/apache-2.4:latest . \
      && cd -

## License

**MIT**
