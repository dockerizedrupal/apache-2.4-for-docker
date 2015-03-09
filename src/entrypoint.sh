#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/httpd/build.sh && /src/httpd/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/httpd/variables.sh && /src/httpd/run.sh"
    ;;
esac
