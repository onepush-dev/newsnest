#!/bin/sh
# Railway volumes mount root-owned: create config/ and data/ on the volume, hand them to uid 1000 (newsnest),
# then run upstream's own command as that user. NewsNest seeds an empty config/ from config.example/ itself.
set -e
mkdir -p "$NEWSNEST_CONFIG_DIR" "$NEWSNEST_DATA_DIR"
chown -R 1000:1000 "$NEWSNEST_CONFIG_DIR" "$NEWSNEST_DATA_DIR"
exec setpriv --reuid=1000 --regid=1000 --init-groups python -m newsnest
