FROM debian:buster-slim

ENV APP_DIR=/root/minecraft
ENV MEMORY=4G

# Install dependencies
RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
        gnupg \
        jq \
        software-properties-common

# Install Corretto
RUN curl -sqL https://apt.corretto.aws/corretto.key | apt-key add - \
    && apt-add-repository 'deb https://apt.corretto.aws stable main' \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        java-16-amazon-corretto-jdk

# Clean up
RUN apt-get remove --purge -y \
        gnupg \
        software-properties-common \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy the start script
WORKDIR $APP_DIR
COPY start.sh ./
ENTRYPOINT ./start.sh

EXPOSE 25565/tcp
VOLUME $APP_DIR
