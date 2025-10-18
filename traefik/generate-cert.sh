#!/usr/bin/env sh

apk add --no-cache openssl
mkdir -p /certs
openssl req -x509 -nodes -days "${CERT_VALIDITY_DAYS:-365}" -newkey "${CERT_KEY_TYPE:-rsa:2048}" \
  -keyout "/certs/$APP_HOSTNAME.key" \
  -out "/certs/$APP_HOSTNAME.crt" \
  -subj "/CN=$APP_HOSTNAME"
