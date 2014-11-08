# docker-apache-2.2.22-dev

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Run the container

Using the `docker` command:

    CONTAINER="apache" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      -v /var/docker/apache-2.2.22/data:/apache-2.2.22/data \
      -d \
      simpledrupalcloud/apache:2.2.22-dev
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-apache.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22-dev \
      && fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-apache.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22-dev \
      && sudo docker build -t simpledrupalcloud/apache:2.2.22-dev . \
      && cd -

## License

**MIT**
