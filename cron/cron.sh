#!/usr/bin/env bash
crontab -l | { cat; echo "0 6 * * * $(pwd)/bing-wallpaper-updater.py >/dev/null 2>&1"; } | crontab -
