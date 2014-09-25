#!/usr/bin/env bash

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
