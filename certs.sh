#!/usr/bin/env bash

all_domains=`echo $CERTS | sed  's/,/ -d /g'`

echo "certbot certonly --no-self-upgrade -n --text --standalone  --standalone-supported-challenges http-01 -d $all_domains --keep --agree-tos --email $EMAIL"

if [ -n "$CERTS" ]; then
    eval "$(certbot certonly --no-self-upgrade -n --text --standalone  --standalone-supported-challenges http-01  -d $all_domains --keep --agree-tos --email $EMAIL)"
fi
