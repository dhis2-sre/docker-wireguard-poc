#!/bin/sh

if [ -f "/certs/internal.crt" ] && [ -f "/certs/internal.key" ]; then
    echo "Certificates already exist. Skipping generation."
    exit 0
fi

mkcert -install
mkcert grafana.internal '*.internal'
mv grafana.internal+1.pem /certs/internal.crt
mv grafana.internal+1-key.pem /certs/internal.key

chmod 644 /certs/internal.key
