FROM --platform=linux/amd64 debian:buster-slim

ENV APP_ID=443030
ENV APP_DIR=/root/conan_exiles
ENV STEAM_DIR=/root/steamcmd

# Install dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
        gnupg \
        lib32gcc1 \
        locales \
        software-properties-common \
        xauth \
        xvfb

# Set up locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Download SteamCMD
WORKDIR $STEAM_DIR
RUN curl -sqL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar zxvf -

# Install Wine
RUN curl -sqL https://dl.winehq.org/wine-builds/winehq.key | apt-key add - \
    && apt-add-repository 'deb http://dl.winehq.org/wine-builds/debian stretch main' \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        fonts-wine \
        libwine \
        libwine:i386 \
        winehq-stable

# Clean up
RUN apt-get remove --purge -y \
        curl \
        gnupg \
        software-properties-common \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy the start script
WORKDIR $APP_DIR
COPY start.sh ./
ENTRYPOINT ./start.sh

EXPOSE 7777-7779/udp 27015/udp
VOLUME $APP_DIR
