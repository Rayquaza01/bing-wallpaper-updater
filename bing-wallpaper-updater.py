#!/usr/bin/env python3
import urllib.request
import json
import os
import sys
import platform
if sys.platform == "win32":
    import ctypes
    system = "windows"
elif sys.platform == "linux":
    if platform.linux_distribution()[0] == "Ubuntu":
        import subprocess
        system = "ubuntu"
    else:
        # error if not ubuntu or windows
        raise NotImplementedError
else:
    raise NotImplementedError


if __name__ == "__main__":
    # get download path
    saveto = os.path.join(os.path.dirname(os.path.abspath(sys.argv[0])), "wall.jpg")
    # download json
    imagejson = urllib.request.urlopen("http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US").read()
    data = json.loads(imagejson.decode("utf-8"))
    url = data["images"][0]["url"]
    # download image
    urllib.request.urlretrieve("http://www.bing.com" + url, saveto)
    if system == "windows":
        # set background on windows (64bit)
        ctypes.windll.user32.SystemParametersInfoW(20, 0, saveto, 0)
    elif system == "ubuntu":
        # set background on ubuntu
        subprocess.Popen(["gsettings", "set", "org.gnome.desktop.background", "picture-uri", "file://" + saveto])
