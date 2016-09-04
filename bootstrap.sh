#!/usr/bin/env bash

/certs.sh
rm /usr/local/etc/haproxy/haproxy.cfg
supervisord -n