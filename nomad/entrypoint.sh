#!/bin/sh

NOMAD_DATA_DIR=${NOMAD_DATA_DIR:-"/opt/data"}
NOMAD_CONFIG_DIR=${NOMAD_CONFIG_DIR:-"/etc/nomad.d"}

if [ -n "$NOMAD_LOCAL_CONFIG" ]; then
	  echo "$NOMAD_LOCAL_CONFIG" > "$NOMAD_CONFIG_DIR/local.hcl"
fi

exec /usr/local/bin/nomad agent -server -config "$NOMAD_CONFIG_DIR"
