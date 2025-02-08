#!/usr/bin/env bash
SYSTEMD_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$SYSTEMD_DIR"
mkdir -p "$BIN_DIR"

cp -v bing-wallpaper "$BIN_DIR"
cp -v systemd/bingwallpaper.service "$SYSTEMD_DIR"
cp -v systemd/bingwallpaper.timer "$SYSTEMD_DIR"

systemctl --user daemon-reload

echo "Enable the service with:"
echo "$ systemctl --user enable --now bingwallpaper.timer"
echo ""
echo "Disable the service with:"
echo "$ systemctl --user disable bingwallpaper.timer"
echo "$ systemctl --user stop bingwallpaper.timer"
