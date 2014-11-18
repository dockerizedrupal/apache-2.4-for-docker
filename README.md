# docker-httpd

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Apache HTTP Server (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="httpddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd):/httpd/data \
      simpledrupalcloud/data:latest
  
    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from httpddata \
      -d \
      simpledrupalcloud/httpd:latest
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/httpd:latest . \
      && cd -

## License

**MIT**
