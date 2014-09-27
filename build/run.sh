#!/usr/bin/env bash

env

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
