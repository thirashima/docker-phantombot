FROM debian:jessie

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    openjdk-7-jre-headless \
    unzip \
    wget

ENV PB_VERSION="2.3.4.1"

RUN mkdir -p /docker
COPY ./docker-entrypoint.sh /
COPY ./botlogin.txt /
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 25000 25001 25002
CMD ["phantombot"]
