#!/usr/bin/with-contenv bashio
# ==============================================================================
# Setup auth data
# ==============================================================================
declare homeassistant_pw
declare enet_pw

AUTH_FILE=/data/auth.db

if bashio::fs.file_exists ${AUTH_FILE}; then
  bashio::log.info "Auth database exists"
  bashio::exit.ok
fi

homeassistant_pw="$(pwgen 64 1)"
enet_pw="$(pwgen 64 1)"

bashio::log.info "Setup mqtt auth db"
config=$(
  bashio::var.json \
    enet_password "${enet_pw}" \
    homeassistant_password "${homeassistant_pw}"
)

echo "$config" >/data/auth.json
