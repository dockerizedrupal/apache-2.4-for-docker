#!/usr/bin/env bash

sudo docker run --name apache -p 80:80 -v /var/www:/var/www -e APACHE_SERVERNAME=example.com -d simpledrupalcloud/apache:2.2.22
