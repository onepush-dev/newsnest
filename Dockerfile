# NewsNest on Railway: official ghcr.io/lucifix/newsnest:0.7.1 (MIT), app unmodified.
# Upstream uses two mounts (/config and /data); Railway allows one volume per service, so both live under /data
# (config in /data/config, SQLite in /data/db). Railway volumes are root-owned, so the wrapper fixes ownership
# and then drops to the image's `newsnest` user.
FROM ghcr.io/lucifix/newsnest:0.7.1
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/newsnest"
USER root
ENV NEWSNEST_CONFIG_DIR=/data/config \
    NEWSNEST_DATA_DIR=/data/db \
    TZ=UTC
COPY railway-start.sh /usr/local/bin/railway-start.sh
RUN chmod +x /usr/local/bin/railway-start.sh
EXPOSE 8080
CMD ["railway-start.sh"]
