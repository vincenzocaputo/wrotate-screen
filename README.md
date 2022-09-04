# wrotate-screen
This is a workaround for screen autorotation issue on Wayland.

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
