#!/bin/sh
chown -R root:root $APP_DIR $STEAM_DIR

$STEAM_DIR/steamcmd.sh \
    +@sSteamCmdForcePlatformType windows \
    +login anonymous \
    +force_install_dir $APP_DIR \
    +app_update $APP_ID validate \
    +quit

xvfb-run --auto-servernum wine ./ConanSandboxServer.exe -log
