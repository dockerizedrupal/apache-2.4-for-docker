# apache-2.4-for-docker

A Docker image for [Apache HTTP Server](http://httpd.apache.org/) version 2.4.

## Run the container

    CONTAINER="apache-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /apache/data \
      -v /apache/ssl \
      --entrypoint /bin/echo \
      dockerizedrupal/apache-2.4:1.2.9 "Data-only container for Apache."

    CONTAINER="apache" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from apache-data \
      -e SERVER_NAME="localhost" \
      -e DOCUMENT_ROOT="/apache/data" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https2,http" \
      -e INDEXES="Off" \
      -e KERBEROS_DEFAULT_REALM="" \
      -e KERBEROS_1_REALM="" \
      -e KERBEROS_1_DOMAIN="" \
      -e KERBEROS_1_KDC="" \
      -e KERBEROS_1_ADMIN_SERVER="" \
      -e HSTS="Off" \
      -e HSTS_MAX_AGE="31536000" \
      -e HSTS_PRELOAD="Off" \
      -e HSTS_INCLUDE_SUBDOMAINS="Off" \
      -e HTTP_BASIC_AUTH="Off" \
      -e HTTP_BASIC_AUTH_USERNAME="container" \
      -e HTTP_BASIC_AUTH_PASSWORD="" \
      -e ESTEID="Off" \
      -e ESTEID_CA_REVOCATION_LIST="Off" \
      -e ESTEID_URL="" \
      -e NO_GZIP="Off" \
      -e CERTBOT="Off" \
      -e CERTBOT_EMAIL="" \
      -e PROXY="Off" \
      -e PROXY_1_PASS="" \
      -e PROXY_1_PASS_REVERSE="" \
      -e USER_ID="" \
      -e GROUP_ID="" \
      -d \
      dockerizedrupal/apache-2.4:1.2.9

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/apache-2.4-for-docker.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.2.9 \
      && sudo docker build -t dockerizedrupal/apache-2.4:1.2.9 . \
      && cd -

## Tests

Tests are implemented in [Bats: Bash Automated Testing System](https://github.com/sstephenson/bats).

### Test results for the current release

    1..13
    ok 1 apache-2.4: freetds: KERBEROS_DEFAULT_REALM
    ok 2 apache-2.4: freetds: KERBEROS_1_REALM
    ok 3 apache-2.4: freetds: KERBEROS_1_DOMAIN
    ok 4 apache-2.4: freetds: KERBEROS_1_KDC
    ok 5 apache-2.4: freetds: KERBEROS_1_ADMIN_SERVER
    ok 6 apache-2.4: freetds: KERBEROS_2_REALM
    ok 7 apache-2.4: freetds: KERBEROS_2_DOMAIN
    ok 8 apache-2.4: freetds: KERBEROS_2_KDC
    ok 9 apache-2.4: freetds: KERBEROS_2_ADMIN_SERVER
    ok 10 apache-2.4: freetds: KERBEROS_3_REALM
    ok 11 apache-2.4: freetds: KERBEROS_3_DOMAIN
    ok 12 apache-2.4: freetds: KERBEROS_3_KDC
    ok 13 apache-2.4: freetds: KERBEROS_3_ADMIN_SERVER

## License

**MIT**
