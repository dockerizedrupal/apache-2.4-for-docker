#!/usr/bin/env bash

dnsLookup() {
  echo "$(host "${1}" | awk '/has address/ { print $4 }')"
}

# PHP52

if [ -z "${PHP52_PORT_9000_TCP}" ] && [ -n "${PHP52_PORT_9000_TCP_ADDR}" ] && [ -n "${PHP52_PORT_9000_TCP_PORT}" ]; then
  IP="$(dnsLookup "${PHP52_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP52_PORT_9000_TCP_ADDR="${IP}"
  fi

  PHP52_PORT_9000_TCP="tcp://${PHP52_PORT_9000_TCP_ADDR}:${PHP52_PORT_9000_TCP_PORT}"
fi

export FACTER_PHP52_PORT_9000_TCP="$(echo "${PHP52_PORT_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP53

if [ -z "${PHP53_PORT_9000_TCP}" ] && [ -n "${PHP53_PORT_9000_TCP_ADDR}" ] && [ -n "${PHP53_PORT_9000_TCP_PORT}" ]; then
  IP="$(dnsLookup "${PHP53_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP53_PORT_9000_TCP_ADDR="${IP}"
  fi

  PHP53_PORT_9000_TCP="tcp://${PHP53_PORT_9000_TCP_ADDR}:${PHP53_PORT_9000_TCP_PORT}"
fi

export FACTER_PHP53_PORT_9000_TCP="$(echo "${PHP53_PORT_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP54

if [ -z "${PHP54_PORT_9000_TCP}" ] && [ -n "${PHP54_PORT_9000_TCP_ADDR}" ] && [ -n "${PHP54_PORT_9000_TCP_PORT}" ]; then
  IP="$(dnsLookup "${PHP54_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP54_PORT_9000_TCP_ADDR="${IP}"
  fi

  PHP54_PORT_9000_TCP="tcp://${PHP54_PORT_9000_TCP_ADDR}:${PHP54_PORT_9000_TCP_PORT}"
fi

export FACTER_PHP54_PORT_9000_TCP="$(echo "${PHP54_PORT_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP55

if [ -z "${PHP55_PORT_9000_TCP}" ] && [ -n "${PHP55_PORT_9000_TCP_ADDR}" ] && [ -n "${PHP55_PORT_9000_TCP_PORT}" ]; then
  IP="$(dnsLookup "${PHP55_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP55_PORT_9000_TCP_ADDR="${IP}"
  fi

  PHP55_PORT_9000_TCP="tcp://${PHP55_PORT_9000_TCP_ADDR}:${PHP55_PORT_9000_TCP_PORT}"
fi

export FACTER_PHP55_PORT_9000_TCP="$(echo "${PHP55_PORT_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP56

if [ -z "${PHP56_PORT_9000_TCP}" ] && [ -n "${PHP56_PORT_9000_TCP_ADDR}" ] && [ -n "${PHP56_PORT_9000_TCP_PORT}" ]; then
  IP="$(dnsLookup "${PHP56_PORT_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP56_PORT_9000_TCP_ADDR="${IP}"
  fi

  PHP56_PORT_9000_TCP="tcp://${PHP56_PORT_9000_TCP_ADDR}:${PHP56_PORT_9000_TCP_PORT}"
fi

export FACTER_PHP56_PORT_9000_TCP="$(echo "${PHP56_PORT_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP

export FACTER_PHP_HOST="$(echo "${PHP_PORT}" | sed 's/tcp:\/\///')"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
