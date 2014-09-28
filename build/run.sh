#!/usr/bin/env bash

dnsLookup() {
  echo "$(host "${1}" | awk '/has address/ { print $4 }')"
}

if [ -z "${PHP52_PORT_9000_TCP}" ]; then
  IP="$(dnsLookup "${PHP52_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP52_PORT_9000_TCP_ADDR="${IP}"
  fi

  export FACTER_PHP52_PORT_9000_TCP="tcp://${PHP52_PORT_9000_TCP_ADDR}:${PHP52_PORT_9000_TCP_PORT}"
fi


if [ -z "${PHP53_PORT_9000_TCP}" ]; then
  IP="$(dnsLookup "${PHP53_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP53_PORT_9000_TCP_ADDR="${IP}"
  fi

  export FACTER_PHP53_PORT_9000_TCP="tcp://${PHP53_PORT_9000_TCP_ADDR}:${PHP53_PORT_9000_TCP_PORT}"
fi

if [ -z "${PHP54_PORT_9000_TCP}" ]; then
  IP="$(dnsLookup "${PHP54_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP54_PORT_9000_TCP_ADDR="${IP}"
  fi

  export FACTER_PHP54_PORT_9000_TCP="tcp://${PHP54_PORT_9000_TCP_ADDR}:${PHP54_PORT_9000_TCP_PORT}"
fi

if [ -z "${PHP55_PORT_9000_TCP}" ]; then
  IP="$(dnsLookup "${PHP55_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP55_PORT_9000_TCP_ADDR="${IP}"
  fi

  export FACTER_PHP55_PORT_9000_TCP="tcp://${PHP55_PORT_9000_TCP_ADDR}:${PHP55_PORT_9000_TCP_PORT}"
fi

if [ -z "${PHP56_PORT_9000_TCP}" ]; then
  IP="$(dnsLookup "${PHP56_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP56_PORT_9000_TCP_ADDR="${IP}"
  fi

  export FACTER_PHP56_PORT_9000_TCP="tcp://${PHP56_PORT_9000_TCP_ADDR}:${PHP56_PORT_9000_TCP_PORT}"
fi

env

puppet apply /etc/puppet/manifests/run.pp

/usr/bin/supervisord
