#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/apache-2.4/build.sh && /src/apache-2.4/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/apache-2.4/variables.sh && /src/apache-2.4/run.sh"
    ;;
esac
