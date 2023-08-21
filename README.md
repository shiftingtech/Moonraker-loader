# Moonraker-loader
A tool to automatically mount an sdcard/usb stick, and push all files to moonraker.

## Installation instructions
(should work on most Debian derived systems, including PiOS)
```
git clone https://github.com/shiftingtech/Moonraker-loader.git
sudo ln -sf ~/Moonraker-loader/assets/89-moonraker-loader.rules /etc/udev/rules.d 
sudo ln -sf ~/Moonraker-loader/assets/*.sh /usr/local/sbin
```

##  Why?  isn't this overcomplicated?
Yes, maybe.  But it means that the Moonraker metadata extraction, and the cancel object parser both run, which they don't in most other non-networked approaches.
