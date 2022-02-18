#!/bin/bash
# sets the wallpaper to the bing wallpaper of the day
# requires jq to be installed
# only works on gnome

# Location for wallpapers to be saved
WALLPAPER_LOCATION="$(xdg-user-dir PICTURES)/bing-wallpaper"
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

    gsettings set org.gnome.desktop.background picture-uri "file://$FILENAME"
fi

if [ "$KEEP_FOR" -ge 0 ]; then
    find "$WALLPAPER_LOCATION/*" -mtime "+$KEEP_FOR" -exec rm {} \;
fi
