# bing-wallpaper-updater

Sets wallpaper to the current Bing Wallpaper of the Day.

Supports GNOME (with `gsettings`) and KDE (with `plasma-apply-wallpaperimage`). On GNOME, the wallpaper will be set for both light and dark mode.

# Installation

`./install.sh` will install the service. `bing-wallpaper` will be copied to `~/.local/bin` and the service and timer files will be copied to `~/.config/systemd/user`

Enabling the timer (`systemctl --user enable --now bingwallpaper.timer`) will run the script daily.

# Customization

You can set the following environment variables to change the script's behavior:

* `$BING_WALLPAPER_LOCATION` - the location to store wallpapers. (Default `$(xdg-user-dir PICTURES)/bing-wallpaper`)
* `$BING_WALLPAPER_KEEP_FOR` - number of days to keep wallpapers saved (Default `7`. Set to `-1` to keep all wallpapers)
