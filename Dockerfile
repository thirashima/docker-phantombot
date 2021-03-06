FROM openjdk:8

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    unzip \
    wget

ENV PB_VERSION="2.3.5.1"

RUN mkdir -p /docker
COPY ./docker-entrypoint.sh /
COPY ./botlogin.txt /
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 25000 25002 25003 25004 25005
CMD ["phantombot"]
