#!/usr/bin/env bash


export PHP52="${PHP52}"
export PHP53="${PHP53}"
export PHP54="${PHP54}"
export PHP55="${PHP55}"
export PHP56="${PHP56}"

env

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
