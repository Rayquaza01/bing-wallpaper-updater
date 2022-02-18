# bing-wallpaper-updater

Updates wallpaper to the current Bing wallpaper of the day

## Python Version

The python version no longer works. `platform.linux_distribution()` is deprecated. Also, the script was checking for Ubuntu instead of gnome for some reason.

## Bash Version

Running the bash version will download the image to `$XDG_PICTURES_DIR/bing-wallpaper` and set the image as the wallpaper (gnome only).

Requires `jq` to be installed to work.

Wallpapers are saved with a timestamp, so the previous day's wallpaper does not get overwritten. Wallpapers can also be automatically deleted after they reach a certain age.
