#!/usr/bin/env bash

echo "${PHP52}"

export PHP52="${PHP52}"

echo "${PHP53}"

export PHP53="${PHP53}"

echo "${PHP54}"

export PHP54="${PHP54}"

echo "${PHP55}"

export PHP55="${PHP55}"

echo "${PHP56}"

export PHP56="${PHP56}"

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
