FROM --platform=linux/amd64 debian:buster-slim

ENV APP_ID=896660
ENV APP_DIR=/root/valheim
ENV SAVE_DIR=/root/.config/unity3d/IronGate/Valheim
ENV STEAM_DIR=/root/steamcmd

# Install dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
        jq \
        lib32gcc1 \
        locales \
        software-properties-common

# Set up locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Download SteamCMD
WORKDIR $STEAM_DIR
RUN curl -sqL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar zxvf -

# Clean up
RUN apt-get remove --purge -y \
        curl \
        software-properties-common \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Create the save directory
RUN mkdir -p $APP_DIR/saves $SAVE_DIR \
    && rm -r $SAVE_DIR \
    && ln -s $APP_DIR/saves $SAVE_DIR

# Copy the start script
WORKDIR $APP_DIR
COPY start.sh ./
ENTRYPOINT ./start.sh

EXPOSE 2456-2457/udp
VOLUME $APP_DIR
