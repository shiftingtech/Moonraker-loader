# Moonraker-loader
A tool to automatically mount an sdcard/usb stick, and push all files to moonraker.

I strongly recommend running Klipper printers on some kind of network, whenever possible.  It's really how the entire stack is designed to work.  
This tool is just a workaround, to help out when that really isn't possible

I also strongly recommend [KlipperScreen](https://klipperscreen.readthedocs.io/en/latest/), if you're trying to use this tool to run a printer without a network connection.

## Installation instructions
(should work on most Debian derived systems, including PiOS)
```
cd ~
git clone https://github.com/shiftingtech/Moonraker-loader.git
sudo ln -sf ~/Moonraker-loader/assets/89-moonraker-loader.rules /etc/udev/rules.d 
sudo ln -sf ~/Moonraker-loader/assets/*.sh /usr/local/sbin
```
then reboot your pi

##  Why?  isn't this overcomplicated?
Yes, maybe.  But it means that the Moonraker metadata extraction, and the cancel object parser both run, which they don't in most other non-networked approaches.

## Usage

1. Put some gcode files in the root directory of an sdcard or usb stick
2. Plug it into the Pi that runs your printer
3. Wait until the files appear in KlipperScreen (or however you're controlling the printer)
4. Remove the stick
