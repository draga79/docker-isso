FROM alpine:3.14

ARG ISSO_VER=0.12.2

ENV GID=1000 UID=1000

RUN apk -U upgrade \
 && apk add -t build-dependencies \
    python3-dev \
    libffi-dev \
    build-base \
 && apk add \
    python3 \
    py3-pip \
    sqlite \
    openssl \
    ca-certificates \
    su-exec \
    tini \
 && pip3 install wheel && pip3 install --no-cache "isso==${ISSO_VER}" \
 && apk del build-dependencies \
 && rm -rf /tmp/* /var/cache/apk/*

COPY run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080

VOLUME /db /config

LABEL maintainer="Stefano Marinelli <stefano@dragas.it>"

CMD ["run.sh"]
