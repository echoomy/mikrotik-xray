FROM ghcr.io/xtls/xray-core:26.10.10 AS xray

FROM alpine:3.24.2

COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray

COPY ./config.template.json /etc/xray/config.template.json

RUN apk add --no-cache gettext-envsubst

COPY --chmod=0755 ./entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
