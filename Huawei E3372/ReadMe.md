The Huawei E3372 608 is a 4G modem, 608 I believe references a version for Australian Optus.

The E3372 (and other Huawei modems) have two modes, USB Modem and HiLink Modem. I believe HiLink mode is a Huawei thing where the modem appears to the host computer as a router, it assigns the Pi an IP address and provides a network route to the internet.

A Linux tool usb_modeswitch is needed to ensure the Pi sees the E3372 as a network device not a mass storage device.
usb_modeswitch is pre-installed in Raspbian OS included in the OGN install.

To enable the correct mode:

First disable overlay_ctl and reboot so the changes are saved to SD card.

run `lsusb' and look for a line similar to the one below

`Bus 001 Device 010: ID 12d1:14db Huawei Technologies Co., Ltd.`E353/E3131

The "12d1" is the Vendor code (Huawei) the "14db" or similar is the Product code.

Now run `sudo nano /etc/udev/rules.d/41-huawei_e3372.rules`

In the editor that opens enter:

```
# Huawei E3372
ATTR{idVendor}=="12d1", ATTR{idProduct}=="14db", RUN+="usb_modeswitch '/%k'" 
```
replace 14db with the product code you found via lsusb if it is different.

press ctrl-o to save the file, then ctrl-x to exit Nano editor.

Enable overlay-ctl and reboot. Note that this needs to be a hard reboot - power off and on again. 

Hopefully the 4G dongle now connects the Pi to the internet.

The Pi can't supply enough power to run the both the RTL-SDR and the E3372. I chose to add a powered USB hub for the Huawei with the power supplied by a small regulator that is switched on and off by the Witty, thus keeping power consumption to a minimum overnight.
