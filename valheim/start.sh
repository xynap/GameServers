#!/bin/sh
chown -R root:root $APP_DIR $STEAM_DIR

$STEAM_DIR/steamcmd.sh \
    +login anonymous \
    +force_install_dir $APP_DIR \
    +app_update $APP_ID validate \
    +quit

LD_LIBRARY_PATH=./linux64 ./valheim_server.x86_64 \
    -name "$(jq -r .name config.json)" \
    -port $(jq -r .port config.json) \
    -world "$(jq -r .world config.json)" \
    -password "$(jq -r .password config.json)" \
    -public "$(jq -r .public config.json)"
