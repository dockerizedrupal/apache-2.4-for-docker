#!/usr/bin/env bash

puppet apply --modulepath=/src/apache-2.4/run/modules /src/apache-2.4/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
