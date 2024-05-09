# SolarOGN
Configuration of solar powered OGN receiver.

This repository documents the configuration of the Mount Emu OGN repeater in North East Victoria, Australia. This unit is stand-alone with solar/battery power and 4G internet access.

## HARDWARE
* Raspberry Pi 3B
* RTL-SDR V3
* LNA4All preamp,bias-T powered
* 9dbi antenna
* Huawei W3372 608 4G modem
* Witty Pi 4 Mini Pi power manager
* 40w solar panel
* 15Ah deep cycle SLA battery
* 10a MPPT solar charge controller (ebay)

## SOFTWARE
[Seb OGN image](http://download.glidernet.org/seb-ogn-rpi-image)
[RUFUS](https://rufus.ie/en/) Bootable image writer. RUFUS is small, portable and works well.
[PuTTY](https://putty.org/) Windows SSH access to Pi (or Linux terminal).
[Global Monitoring Laboratory Sunrise/Sunset table](https://gml.noaa.gov/grad/solcalc/table.php?lat=-36.67152&lon=147.21922&year=2024) set lat & lon to your location. The year makes insignificant differences.
[Witt Pi script gen](http://www.uugear.com/app/wittypi-scriptgen/) to check &/or create your monthly scripts.
Script and .wpi files for Witty Pi scheduling in Software folder.

## Initial setup
Use RUFUS to write the Seb OGN image to SD card.
Before first boot update the OGN config file:
* Lat/Lon
* station name
* password
* WiFi credentials (if using wifi to access the Pi).
* If using Bias-T powered amp enable it now in the config file. **Do NOT connect an antenna direct to a Bias-T enabled SDR. You will blow up your SDR**

### Pre-startup tasks
Edit the Witty monthly script files to suit your location and needs. The sample files are set so the unit powers on at 9am daily and shuts down roughly around sunset (I used the 15th of each month and rounded to the nearest 15 minutes) The sum of the two durations ON & OFF must equal 24.

### First Boot
On first boot of the Pi the SD Card will be writeable. Subsequent boots will have enabled OverlayFS so the card is read only. Be sure to know what files & software you are going to update before you boot your Pi for the first time. It's possible to make changes later, but it's easiest on first boot.

SSH into your Pi. 

Install Witty Pi software
```
wget https://www.uugear.com/repo/WittyPi4/install.sh
sudo sh install.sh
```
`cd ~/wittpi` to the witty pi directory, then run the Witty Pi config script `./wittyPi.sh`
In the config script check if the Pi time is correct (it should update from the internet if connected). You can type 3 to force it to update.
It's worth setting these options at this stage. 
7. Set low voltage threshold - _this should be slightly higher than any low voltage threshold set within your charge controller. Maybe 11.4V?_
8. Set recovery voltage threshold - _set this high enough to avoid the power cycling on low solar days. Maybe 12.1V ? _
9. Set over temperature action - _somewhat higher than the hottest daily temperature plus a small allowance. 48C ?_



