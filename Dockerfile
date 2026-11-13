# NewsNest on Railway: official image ghcr.io/lucifix/newsnest:0.7.1, app unmodified, plus a tiny start wrapper.
# Railway changes only: /config and /data folded onto ONE Railway volume (/newsnest/config, /newsnest/data), which the
# wrapper chowns for the image's uid 1000 (Railway volumes mount root-owned) before dropping privileges, like upstream.
FROM ghcr.io/lucifix/newsnest:0.7.1
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/newsnest"
USER 0
COPY railway-start.sh /usr/local/bin/railway-start.sh
RUN chmod +x /usr/local/bin/railway-start.sh
ENV NEWSNEST_CONFIG_DIR=/newsnest/config \
    NEWSNEST_DATA_DIR=/newsnest/data \
    TZ=UTC
EXPOSE 8080
CMD ["/usr/local/bin/railway-start.sh"]
