#!/usr/bin/env bash

dnsLookup() {
  echo "$(host "${1}" | awk '/has address/ { print $4 }')"
}

# PHP52

if [ -z "${PHP52_DOMAIN_9000_TCP}" ] && [ -n "${PHP52_DOMAIN_9000_TCP_ADDR}" ] && [ -n "${PHP52_DOMAIN_9000_TCP_DOMAIN}" ]; then
  IP="$(dnsLookup "${PHP52_DOMAIN_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP52_DOMAIN_9000_TCP_ADDR="${IP}"
  fi

  PHP52_DOMAIN_9000_TCP="tcp://${PHP52_DOMAIN_9000_TCP_ADDR}:${PHP52_DOMAIN_9000_TCP_DOMAIN}"
fi

export FACTER_PHP52_DOMAIN_9000_TCP="$(echo "${PHP52_DOMAIN_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP53

if [ -z "${PHP53_DOMAIN_9000_TCP}" ] && [ -n "${PHP53_DOMAIN_9000_TCP_ADDR}" ] && [ -n "${PHP53_DOMAIN_9000_TCP_DOMAIN}" ]; then
  IP="$(dnsLookup "${PHP53_DOMAIN_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP53_DOMAIN_9000_TCP_ADDR="${IP}"
  fi

  PHP53_DOMAIN_9000_TCP="tcp://${PHP53_DOMAIN_9000_TCP_ADDR}:${PHP53_DOMAIN_9000_TCP_DOMAIN}"
fi

export FACTER_PHP53_DOMAIN_9000_TCP="$(echo "${PHP53_DOMAIN_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP54

if [ -z "${PHP54_DOMAIN_9000_TCP}" ] && [ -n "${PHP54_DOMAIN_9000_TCP_ADDR}" ] && [ -n "${PHP54_DOMAIN_9000_TCP_DOMAIN}" ]; then
  IP="$(dnsLookup "${PHP54_DOMAIN_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP54_DOMAIN_9000_TCP_ADDR="${IP}"
  fi

  PHP54_DOMAIN_9000_TCP="tcp://${PHP54_DOMAIN_9000_TCP_ADDR}:${PHP54_DOMAIN_9000_TCP_DOMAIN}"
fi

export FACTER_PHP54_DOMAIN_9000_TCP="$(echo "${PHP54_DOMAIN_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP55

if [ -z "${PHP55_DOMAIN_9000_TCP}" ] && [ -n "${PHP55_DOMAIN_9000_TCP_ADDR}" ] && [ -n "${PHP55_DOMAIN_9000_TCP_DOMAIN}" ]; then
  IP="$(dnsLookup "${PHP55_DOMAIN_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP55_DOMAIN_9000_TCP_ADDR="${IP}"
  fi

  PHP55_DOMAIN_9000_TCP="tcp://${PHP55_DOMAIN_9000_TCP_ADDR}:${PHP55_DOMAIN_9000_TCP_DOMAIN}"
fi

export FACTER_PHP55_DOMAIN_9000_TCP="$(echo "${PHP55_DOMAIN_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP56

if [ -z "${PHP56_DOMAIN_9000_TCP}" ] && [ -n "${PHP56_DOMAIN_9000_TCP_ADDR}" ] && [ -n "${PHP56_DOMAIN_9000_TCP_DOMAIN}" ]; then
  IP="$(dnsLookup "${PHP56_DOMAIN_9000_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    PHP56_DOMAIN_9000_TCP_ADDR="${IP}"
  fi

  PHP56_DOMAIN_9000_TCP="tcp://${PHP56_DOMAIN_9000_TCP_ADDR}:${PHP56_DOMAIN_9000_TCP_DOMAIN}"
fi

export FACTER_PHP56_DOMAIN_9000_TCP="$(echo "${PHP56_DOMAIN_9000_TCP}" | sed 's/tcp:\/\///')"

# PHP

export FACTER_PHP_REALM="$(echo "${PHP_DOMAIN}" | sed 's/tcp:\/\///')"

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

export FACTER_KERBEROS_DEFAULT_REALM="${KERBEROS_DEFAULT_REALM}"

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" == KERBEROS_*_REALM=* ]]; then
    i="$(echo ${VARIABLE} | awk -F '_' '{ print $2 }')"

    KERBEROS_REALM="KERBEROS_${i}_REALM"
    KERBEROS_DOMAIN="KERBEROS_${i}_DOMAIN"
    KERBEROS_KDC="KERBEROS_${i}_KDC"
    KERBEROS_ADMIN_SERVER="KERBEROS_${i}_ADMIN_SERVER"

    if [ -z "${!KERBEROS_REALM}" ]; then
      continue
    fi

    if [ -z "${!KERBEROS_REALM}" ]; then
      continue
    fi

    if [ -z "${!KERBEROS_KDC}" ]; then
      continue
    fi

    if [ -z "${!KERBEROS_ADMIN_SERVER}" ]; then
      continue
    fi

    export "FACTER_${KERBEROS_REALM}=${!KERBEROS_REALM}"
    export "FACTER_${KERBEROS_DOMAIN}=${!KERBEROS_DOMAIN}"
    export "FACTER_${KERBEROS_KDC}=${!KERBEROS_KDC}"
    export "FACTER_${KERBEROS_ADMIN_SERVER}=${!KERBEROS_ADMIN_SERVER}"
  fi
done
