# bing-wallpaper-updater

Updates wallpaper to the current Bing wallpaper of the day

Running the bash version will download the image to `$(xdg-user-dir PICTURES)/bing-wallpaper` and set the image as the wallpaper. (Supports GNOME and KDE)

Wallpapers are saved with a timestamp, so the previous day's wallpaper does not get overwritten. Wallpapers can also be automatically deleted after they reach a certain age.

# Installation

`./install.sh` will install the service. `bing-wallpaper` will be copied to `~/.local/bin` and the service and timer files will be copied to `~/.config/systemd/user`

Enabling the timer (`systemctl --user enable --now bingwallpaper.timer`) will run the script daily.
