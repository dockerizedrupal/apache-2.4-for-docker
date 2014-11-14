# docker-httpd-2.2.22

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Apache HTTP Server 2.2.22 (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /var/docker/httpd-2.2.22/data:/httpd-2.2.22/data \
      simpledrupalcloud/data:latest
  
    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from data \
      -d \
      simpledrupalcloud/httpd:2.2.22
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22 \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22 \
      && sudo docker build -t simpledrupalcloud/httpd:2.2.22 . \
      && cd -

## License

**MIT**
