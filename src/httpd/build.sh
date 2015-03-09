#!/usr/bin/env bash

puppet apply --modulepath=/src/httpd/build/modules /src/httpd/build/build.pp
