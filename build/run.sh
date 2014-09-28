#!/usr/bin/env bash

export FACTER_PHP52_PORT="${PHP52_PORT}"
export FACTER_PHP53_PORT="${PHP53_PORT}"
export FACTER_PHP54_PORT="${PHP54_PORT}"
export FACTER_PHP55_PORT="${PHP55_PORT}"
export FACTER_PHP56_PORT="${PHP56_PORT}"

echo $PHP52_PORT
echo $PHP53_PORT
echo $PHP54_PORT
echo $PHP55_PORT
echo $PHP56_PORT

env

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
