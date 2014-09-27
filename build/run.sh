#!/usr/bin/env bash

export FACTER_PHP52="${PHP52}"
export FACTER_PHP53="${PHP53}"
export FACTER_PHP54="${PHP54}"
export FACTER_PHP55="${PHP55}"
export FACTER_PHP56="${PHP56}"

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
