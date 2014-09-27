#!/usr/bin/env bash

echo "${PHP52}"
echo "${PHP53}"
echo "${PHP54}"
echo "${PHP55}"
echo "${PHP56}"

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
