#!/bin/sh
# Random banner script for OpenWRT

BANNERS_DIR="/etc/banner.d"
BANNER_FILE="/etc/banner"

if [ -d "$BANNERS_DIR" ]; then
  FILE=$(find "$BANNERS_DIR" -type f | shuf -n 1)
  [ -n "$FILE" ] && cat "$FILE" > "$BANNER_FILE"
fi
