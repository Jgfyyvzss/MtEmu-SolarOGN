As the receiver is at quite a remote location (2-3 hour turnaround) remote SSH access is essential but complicated by being behind a 4G modem. The solution is some sort of Reverse Tunnel.

There are various solutions to establishing reverse tunnels but my criteria of being free, easily transferable should I disappear from the scene and relatively simple to manage lead me to Openport.io

To setup Openport on the Pi 3B:

Disable file overlayctl and reboot.
```
overlayctl disable
```
Power off then power on the Pi.

Now: 
```
wget https://openport.io/download/arm/latest.deb
sudo dpkg -i latest.deb
```
Log in to the Openport account and get the Key token, then on the Pi
```
openport register-key <your-token>
```

Openport has a --restart-on-reboot option but for some reason this restarts the openport task but does not set it running so it is useless to us without running the command to restart-sessions.
In order to overcome this I've added an entry in the user crontab to run a bash script on reboot that checks for internet connection then starts the openport service.
See openportStart.sh for the scipt.
In the user crontab I've added
```
@reboot /home/pi/openportStart.sh &
````

Openport should now restart on each boot.

Note that the free Openport issues a new port to the service every day. So to connect to the Pi remotely you first need to 
* login to [openport.io/user/sessions](https://openport.io/user/sessions)
* click on the "Open-for-ip" icon for ogn-ymbt. This lets Openport know that your current IP is authorised to access the remote device.
* Get the address of the receiver, something like spr.openport.io:12345, where the 12345 is the port currently assigned

Now SSH in to the Pi using the spr.openport.io as the address and the digits after the : as the port.
```
ssh pi@spr.openpoort.io -p 12345
```

On Windows machines you'll need PuTTY, on Mac or Linux just use a shell (command prompt window) `SSH xxx@spr.openport.io:12345`
