#!/bin/bash

set -e
#set the DEBUG env variable to turn on debugging
[[ -n "$DEBUG" ]] && set -x

# Required vars
HAPROXY_MODE=${HAPROXY_MODE:-consul}
HAPROXY_DOMAIN=${HAPROXY_DOMAIN:-haproxy.service.consul}
CONSUL_TEMPLATE=${CONSUL_TEMPLATE:-/usr/local/bin/consul-template}
CONSUL_CONFIG=${CONSUL_CONFIG:-/consul-template/config.d}
CONSUL_CONNECT=${CONSUL_CONNECT:-consul.service.consul:8500}
CONSUL_MINWAIT=${CONSUL_MINWAIT:-2s}
CONSUL_MAXWAIT=${CONSUL_MAXWAIT:-10s}
CONSUL_LOGLEVEL=${CONSUL_LOGLEVEL:-info}

# Force a template regeneration on restart (if this file hasn't changed,
# consul-template won't run the 'optional command' and thus haproxy won't
# be started)
[[ -f /usr/local/etc/haproxy/haproxy.cfg ]] && rm /usr/local/etc/haproxy/haproxy.cfg
