#!/usr/bin/env bash

sudo docker run --name apache --net host -v /opt/data/apache-2.2.22:/data -v /var/www:/var/www -e APACHE_SERVERNAME=example.com -d simpledrupalcloud/apache:2.2.22
