#!/usr/bin/env bash

if [ -n "$CERTS" ]; then
    certbot certonly --no-self-upgrade -n --text --standalone \
        --standalone-supported-challenges http-01 \
        -d {$CERTS//,/ -d } --keep --agree-tos --email "$EMAIL" \
        || exit 1
fi
exit 0
