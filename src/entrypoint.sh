#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "/src/apache-2.4/build/build.sh && /src/apache-2.4/clean/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/apache-2.4/run/variables.sh && /src/apache-2.4/run/run.sh"
    ;;
esac
