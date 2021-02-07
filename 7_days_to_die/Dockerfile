FROM --platform=linux/amd64 debian:buster-slim

ENV APP_ID=294420
ENV APP_DIR=/root/7_days_to_die
ENV STEAM_DIR=/root/steamcmd

# Install dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
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

# Copy the start script
WORKDIR $APP_DIR
COPY start.sh ./
ENTRYPOINT ./start.sh

EXPOSE 26900/tcp 26900-26903/udp
VOLUME $APP_DIR
