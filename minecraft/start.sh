#!/bin/sh
VERSION=$(curl -sqL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r .latest.release)
curl -sqL https://papermc.io/api/v1/paper/$VERSION/latest/download -o paper_server.jar

java \
    -Xms$MEMORY \
    -Xmx$MEMORY \
    -XX:+AlwaysPreTouch \
    -XX:+DisableExplicitGC \
    -XX:+ParallelRefProcEnabled \
    -XX:+PerfDisableSharedMem \
    -XX:+UnlockExperimentalVMOptions \
    -XX:+UseG1GC \
    -XX:G1NewSizePercent=30 \
    -XX:G1MaxNewSizePercent=40 \
    -XX:G1HeapRegionSize=8M \
    -XX:G1ReservePercent=20 \
    -XX:G1HeapWastePercent=5 \
    -XX:G1MixedGCCountTarget=4 \
    -XX:G1MixedGCLiveThresholdPercent=90 \
    -XX:G1RSetUpdatingPauseTimePercent=5 \
    -XX:InitiatingHeapOccupancyPercent=15 \
    -XX:MaxGCPauseMillis=200 \
    -XX:MaxTenuringThreshold=1 \
    -XX:SurvivorRatio=32 \
    -jar ./paper_server.jar --noconsole
