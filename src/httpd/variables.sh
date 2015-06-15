#!/usr/bin/env bash

export FACTER_PHP_HOST="$(echo "${PHP_PORT}" | sed 's/tcp:\/\///')"

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

if [ -z "${TIMEOUT}" ]; then
  TIMEOUT="300"
fi

export FACTER_TIMEOUT="${TIMEOUT}"

if [ -z "${PROTOCOLS}" ]; then
  PROTOCOLS="https,http"
fi

PROTOCOLS=$(echo "${PROTOCOLS}" | tr "," "\n")

for PROTOCOL in ${PROTOCOLS}; do
  if [ "${PROTOCOL}" == "http" ]; then
    export FACTER_HTTP="1"
  fi

  if [ "${PROTOCOL}" == "https" ]; then
    export FACTER_HTTPS="1"
  fi
done

if [ -z "${INDEXES}" ]; then
  INDEXES="0"
fi

export FACTER_INDEXES="${INDEXES}"

export FACTER_KERBEROS_DEFAULT_REALM="${KERBEROS_DEFAULT_REALM}"

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" =~ ^KERBEROS_[[:digit:]]_REALM=.*$ ]]; then
    i="$(echo ${VARIABLE} | awk -F '_' '{ print $2 }')"

    KERBEROS_REALM="KERBEROS_${i}_REALM"
    KERBEROS_DOMAIN="KERBEROS_${i}_DOMAIN"
    KERBEROS_KDC="KERBEROS_${i}_KDC"
    KERBEROS_ADMIN_SERVER="KERBEROS_${i}_ADMIN_SERVER"

    if [ -z "${!KERBEROS_REALM}" ]; then
      continue
    fi

    if [ -z "${!KERBEROS_DOMAIN}" ]; then
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
