#!/usr/bin/env bash

/certs.sh && /regenerate_consul_template.sh && supervisord -n
