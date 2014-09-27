#!/usr/bin/env bash

export FACTER_PHP52_PORT="${PHP52_PORT}"
export FACTER_PHP53_PORT="${PHP53_PORT}"
export FACTER_PHP54_PORT="${PHP54_PORT}"
export FACTER_PHP55_PORT="${PHP55_PORT}"
export FACTER_PHP56_PORT="${PHP56_PORT}"

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
