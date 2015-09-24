# docker-apache-2.4

A [Docker](https://docker.com/) image for [Apache HTTP Server](http://httpd.apache.org/) version 2.4.

## Run the container

    CONTAINER="apache-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /apache/data \
      -v /apache/ssl \
      dockerizedrupal/data:1.0.3

    CONTAINER="apache" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from apache-data \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e INDEXES="Off" \
      -e KERBEROS_DEFAULT_REALM="" \
      -e KERBEROS_1_REALM="" \
      -e KERBEROS_1_DOMAIN="" \
      -e KERBEROS_1_KDC="" \
      -e KERBEROS_1_ADMIN_SERVER="" \
      -e HTTP_BASIC_AUTH_USERNAME="container" \
      -e HTTP_BASIC_AUTH_PASSWORD="" \
      -e USER_ID="" \
      -e GROUP_ID="" \
      -d \
      dockerizedrupal/apache-2.4:1.0.16

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-apache-2.4.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.16 \
      && sudo docker build -t dockerizedrupal/apache-2.4:1.0.16 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**
