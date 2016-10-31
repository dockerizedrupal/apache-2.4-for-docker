#!/usr/bin/env bash

export FACTER_PHP_HOST="$(echo "${PHP_PORT}" | sed 's/tcp:\/\///')"

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

if [ -z "${TIMEZONE}" ]; then
  TIMEZONE="Etc/UTC"
fi

export FACTER_TIMEZONE="${TIMEZONE}"

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
  INDEXES="Off"
fi

export FACTER_INDEXES="${INDEXES}"

if [ -z "${USER_ID}" ]; then
  USER_ID=$(id www-data -u)
fi

export FACTER_USER_ID="${USER_ID}"

if [ -z "${GROUP_ID}" ]; then
  GROUP_ID=$(id www-data -g)
fi

export FACTER_GROUP_ID="${GROUP_ID}"

export FACTER_KERBEROS_DEFAULT_REALM="${KERBEROS_DEFAULT_REALM}"

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" =~ ^KERBEROS_[[:digit:]]+_REALM=.*$ ]]; then
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

if [ -z "${HTTP_BASIC_AUTH}" ]; then
  HTTP_BASIC_AUTH="Off"
fi

export FACTER_HTTP_BASIC_AUTH="${HTTP_BASIC_AUTH}"

if [ -z "${HTTP_BASIC_AUTH_USERNAME}" ]; then
  HTTP_BASIC_AUTH_USERNAME="container"
fi

export FACTER_HTTP_BASIC_AUTH_USERNAME="${HTTP_BASIC_AUTH_USERNAME}"

export FACTER_HTTP_BASIC_AUTH_PASSWORD="${HTTP_BASIC_AUTH_PASSWORD}"

if [ -z "${DOCUMENT_ROOT}" ]; then
  DOCUMENT_ROOT="/apache/data"
fi

export FACTER_DOCUMENT_ROOT="${DOCUMENT_ROOT}"

if [ "${PROTOCOLS}" == "https" ]; then
  if [ -z "${HSTS}" ]; then
    HSTS="Off"
  fi

  export FACTER_HSTS="${HSTS}"

  if [ -z "${HSTS_MAX_AGE}" ]; then
    HSTS_MAX_AGE="31536000"
  fi

  export FACTER_HSTS_MAX_AGE="${HSTS_MAX_AGE}"

  if [ -z "${HSTS_PRELOAD}" ]; then
    HSTS_PRELOAD="Off"
  fi

  export FACTER_HSTS_PRELOAD="${HSTS_PRELOAD}"

  if [ -z "${HSTS_INCLUDE_SUBDOMAINS}" ]; then
    HSTS_INCLUDE_SUBDOMAINS="Off"
  fi

  export FACTER_HSTS_INCLUDE_SUBDOMAINS="${HSTS_INCLUDE_SUBDOMAINS}"
fi

if [ -z "${ESTEID}" ]; then
  ESTEID="Off"
fi

if [ "${ESTEID}" == "On" ]; then
  export FACTER_HTTPS="1"
fi

export FACTER_ESTEID="${ESTEID}"

if [ -z "${ESTEID_CA_REVOCATION_LIST}" ]; then
  ESTEID_CA_REVOCATION_LIST="Off"
fi

export FACTER_ESTEID_CA_REVOCATION_LIST="${ESTEID_CA_REVOCATION_LIST}"

export FACTER_ESTEID_URL="${ESTEID_URL}"

if [ -z "${NO_GZIP}" ]; then
  NO_GZIP="Off"
fi

export FACTER_NO_GZIP="${NO_GZIP}"

if [ -z "${CERTBOT}" ]; then
  CERTBOT="Off"
fi

export FACTER_CERTBOT="${CERTBOT}"

export FACTER_CERTBOT_EMAIL="${CERTBOT_EMAIL}"

if [ -z "${PROXY}" ]; then
  PROXY="Off"
fi

export FACTER_PROXY="${PROXY}"

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" =~ ^PROXY_[[:digit:]]+_PASS=.*$ ]]; then
    i="$(echo ${VARIABLE} | awk -F '_' '{ print $2 }')"

    PROXY_PASS="PROXY_${i}_PASS"
    PROXY_PASS_REVERSE="PROXY_${i}_PASS_REVERSE"

    if [ -z "${!PROXY_PASS}" ]; then
      continue
    fi

    if [ -z "${!PROXY_PASS_REVERSE}" ]; then
      continue
    fi

    export "FACTER_${PROXY_PASS}=${!PROXY_PASS}"
    export "FACTER_${PROXY_PASS_REVERSE}=${!PROXY_PASS_REVERSE}"
  fi
done