#!/usr/bin/env bash

/certs.sh
rm /usr/local/etc/haproxy/haproxy.cfg
mkdir -p /usr/local/etc/haproxy/certs
for site in `ls -1 /etc/letsencrypt/live`; do
    cat /etc/letsencrypt/live/$site/privkey.pem \
      /etc/letsencrypt/live/$site/fullchain.pem \
      | tee /usr/local/etc/haproxy/certs/haproxy-"$site".pem >/dev/null
done
supervisord -n