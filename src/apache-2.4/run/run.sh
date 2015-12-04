#!/usr/bin/env bash

puppet apply --modulepath=/src/apache-2.4/run/puppet/modules /src/apache-2.4/run/puppet/run.pp

supervisord -c /etc/supervisor/supervisord.conf
