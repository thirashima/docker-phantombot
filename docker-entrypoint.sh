#!/bin/bash
set -e

if [ "$1" = 'phantombot' ]; then
    if [ ! -d /docker/PhantomBot-${PB_VERSION} ]; then
        wget \
        --header="User-Agent: Docker-man" \
        https://github.com/PhantomBot/PhantomBot/releases/download/v${PB_VERSION}/PhantomBot-${PB_VERSION}.zip \
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

    if [ -f /provided_botlogin.txt ]; then
        cp /provided_botlogin.txt /docker/PhantomBot-${PB_VERSION}/botlogin.txt
    fi
    if [ -d /persistent ]; then
        ln -sf /persistent/phantombot.db /docker/PhantomBot-${PB_VERSION}/phantombot.db
    fi

    /docker/PhantomBot-${PB_VERSION}/launch-service.sh
fi
exec "$@"
