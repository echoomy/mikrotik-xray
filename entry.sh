#!/usr/bin/env sh

set -eu

envsubst < /etc/xray/config.template.json > /etc/xray/config.json

exec xray run -c /etc/xray/config.json
