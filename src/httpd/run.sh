#!/usr/bin/env bash

puppet apply --modulepath=/src/httpd/run/modules /src/httpd/run/run.pp

/usr/bin/supervisord
