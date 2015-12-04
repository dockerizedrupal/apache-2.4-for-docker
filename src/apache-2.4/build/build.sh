#!/usr/bin/env bash

set -e
set -x

# User
apt-get update

groupadd -o -g $(id -g www-data) container

useradd -m -o -s /bin/bash -u $(id -u www-data) -g $(id -g www-data) container

# Apache
apt-get install -y apache2
apt-get install -y apache2-utils

cp /src/apache-2.4/build/files/etc/supervisor/conf.d/apache-2.4.conf /etc/supervisor/conf.d/apache-2.4.conf

cp /src/apache-2.4/build/files/etc/apache2/conf-available/logs.conf /etc/apache2/conf-available/logs.conf

ln -s /etc/apache2/conf-available/logs.conf /etc/apache2/conf-enabled/logs.conf

ln -sf /dev/stdout /var/log/apache2/access.log

ln -sf /dev/stderr /var/log/apache2/error.log

usermod -d /apache/data www-data

a2enmod actions
a2enmod proxy_fcgi
a2enmod vhost_alias
a2enmod rewrite
a2enmod ssl
a2enmod headers

rm -rf /var/www

rm -f /etc/apache2/sites-enabled/000-default.conf

rm -f /etc/apache2/conf-enabled/other-vhosts-access-log.conf

rm -f /var/log/apache2/other_vhosts_access.log

cp /src/apache-2.4/build/files/etc/apache2/envvars /etc/apache2/envvars

cp /src/apache-2.4/build/files/etc/apache2/conf-available/security.conf /etc/apache2/conf-available/security.conf

rm -f /etc/apache2/conf-enabled/security.conf

ln -s /etc/apache2/conf-available/security.conf /etc/apache2/conf-enabled/security.conf

mkdir -p /etc/htpasswd

# Kerberos
DEBIAN_FRONTEND=noninteractive apt-get install -y libapache2-mod-auth-kerb

DEBIAN_FRONTEND=noninteractive apt-get install -y krb5-user
