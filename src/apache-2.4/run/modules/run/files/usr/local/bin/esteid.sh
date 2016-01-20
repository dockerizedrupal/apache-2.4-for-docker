#!/usr/bin/env bash

cd /apache/ssl/revocation

for f in *.crl; do
  openssl crl -in $f -out $f -inform DER
done

for f in *.crl; do
  FILE_NAME="$(openssl crl -hash -noout -in $f).r0"

  if [ ! -f "${FILE_NAME}" ]; then
    ln -s $f "${FILE_NAME}"
  fi
done
