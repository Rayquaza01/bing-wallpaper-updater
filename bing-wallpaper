#!/bin/bash
# sets the wallpaper to the bing wallpaper of the day
# requires curl and jq
# works with gnome (gsettings) and kde (plasma-apply-wallpaperimage)

PICTURES_DIR="$HOME/Pictures"
if command -v xdg-user-dir &>/dev/null; then
    PICTURES_DIR=$(xdg-user-dir PICTURES)
fi
# Location for wallpapers to be saved
WALLPAPER_LOCATION="$PICTURES_DIR/bing-wallpaper"

if ! [ -d "$WALLPAPER_LOCATION" ]; then
    mkdir -p "$WALLPAPER_LOCATION"
fi

# Timestamp for file name
TIMESTAMP=$(date +"%Y%m%d")
# File location
FILENAME="$WALLPAPER_LOCATION/$TIMESTAMP.jpg"
# Number of days to keep wallpapers. -1 to disable
KEEP_FOR=7

mkdir -p "$WALLPAPER_LOCATION"

# only download and set wallpaper if not already downloaded
if [ ! -f "$FILENAME" ]; then
    IMAGE_URL_BASE=$(curl "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US" | jq -r ".images[0].url")

    curl "https://bing.com$IMAGE_URL_BASE" -o "$FILENAME"

    # apply wallpaper on GNOME
    # apply as both dark and light wallpaper
    if command -v gsettings &>/dev/null; then
        gsettings set org.gnome.desktop.background picture-uri "file://$FILENAME"
        gsettings set org.gnome.desktop.background picture-uri-dark "file://$FILENAME"
    fi

    # apply wallpaper on KDE
    if command -v plasma-apply-wallpaperimage &>/dev/null; then
        plasma-apply-wallpaperimage "$FILENAME"
    fi
fi

if [ "$KEEP_FOR" -ge 0 ]; then
    find "$WALLPAPER_LOCATION"/* -mtime "+$KEEP_FOR" -exec rm {} \;
fi
