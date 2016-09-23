#!/bin/sh
/usr/local/bin/consul-template -config /consul-template/config.d -log-level info -wait 2s:10s -consul $CONSUL_CONNECT
