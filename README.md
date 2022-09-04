# wrotate-screen
This is a workaround for screen autorotation issue on GNOME Wayland.

The script relies on rotate-monitor key shortcut:

```
gsettings set org.gnome.mutter.keybindings rotate-monitor ['XF86RotateWindows', '<Control>F8']
```
You may have to adjust the key code used in the script in order to make the script working properly. See `/usr/include/linux/input-event-codes.h` for available key codes.

## Requirements
- iio-sensor-proxy
- ydotool

## Quick Install

```
git clone https://github.com/vincenzocaputo/wrotate-screen
cd wrotate-screen
sudo cp rotate-screen.sh /usr/local/bin/rotate-screen.sh
sudo chmod +x /usr/local/bin/rotate-screen.sh
sudo cp rotate-screen.service /etc/systemd/system/rotate-screen.service
sudo systemctl enable rotate-screen.service
sudo systemctl start rotate-screen.service
```
