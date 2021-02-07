#!/bin/sh
chown -R root:root $APP_DIR $STEAM_DIR

$STEAM_DIR/steamcmd.sh \
    +login anonymous \
    +force_install_dir $APP_DIR \
    +app_update $APP_ID validate \
    +quit

LD_LIBRARY_PATH=. ./7DaysToDieServer.x86_64 \
    -configfile=./Saves/serverconfig.xml \
    -logfile /dev/stdout \
    -quit \
    -batchmode \
    -nographics \
    -dedicated
