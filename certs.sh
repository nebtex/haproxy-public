#!/usr/bin/env bash

IFS=',' read -r -a array <<< "$CERTS"

for element in "${array[@]}"
do
   certbot certonly --no-self-upgrade -n --text --standalone  --standalone-supported-challenges http-01 -d "$element" --keep --agree-tos --email "$EMAIL"
done
