FROM alpine:3.10
MAINTAINER Bruce Sun <okampfer@gmail.com>

ENV PGWEB_VERSION 0.11.4

ADD https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_amd64.zip /tmp/pgweb_linux_amd64.zip
ADD entrypoint.sh /entrypoint.sh

ENV BIND_ADDRESS 0.0.0.0
ENV LISTEN_PORT 8080

RUN chmod +x /entrypoint.sh && \
    cd /tmp && \
    unzip pgweb_linux_amd64.zip -d /usr/bin && \
    mv /usr/bin/pgweb_linux_amd64 /usr/bin/pgweb && \
    rm -f pgweb_linux_amd64.zip

ENTRYPOINT ["/entrypoint.sh"]
