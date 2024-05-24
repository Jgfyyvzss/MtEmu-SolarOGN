To install WittyPi software to the Pi:
You may need to make extra room in SD card before you can expand the filesystem. I did this by deleting the non-current kernel, then expand filesystem, then update/upgrade the kernel.


Boot the Pi & login

overlayctl disable

sudo reboot

wget https://www.uugear.com/repo/WittyPi4/install.sh

sudo sh install.sh

overlayctl enable

sudo reboot
