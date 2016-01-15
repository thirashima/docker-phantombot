#!/bin/bash
set -e

if [ "$1" = 'phantombot' ]; then
    if [ ! -d /docker/PhantomBot-${PB_VERSION} ]; then
        wget \
        --header="User-Agent: Docker-man" \
        http://www.phantombot.net/downloads/PhantomBot-${PB_VERSION}.zip \
        && unzip -o PhantomBot-${PB_VERSION}.zip -d /docker/ \
        && rm -f PhantomBot-${PB_VERSION}.zip \
        && mv /botlogin.txt /docker/PhantomBot-${PB_VERSION}/ \
        && sed -i "s/\%BOT_USERNAME\%/${BOT_USERNAME}/g;
                s/\%BOT_OAUTH\%/${BOT_OAUTH}/g;
                s/\%BOT_CHANNEL\%/${BOT_CHANNEL}/g;
                s/\%BOT_OWNER\%/${BOT_OWNER}/g;" \
                "/docker/PhantomBot-${PB_VERSION}/botlogin.txt" \
        && chmod +x "/docker/PhantomBot-${PB_VERSION}/launch-service.sh"
    fi

    /docker/PhantomBot-${PB_VERSION}/launch-service.sh
fi
exec "$@"
