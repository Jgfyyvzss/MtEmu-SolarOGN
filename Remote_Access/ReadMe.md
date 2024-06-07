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
openport 22 --restart-on-reboot --daemonize
```
Openport should now be running.

To connect to the Pi remotely, login to Openport and click on the "Open-for-ip" icon for ogn-ymbt. This lets Openport know that your current IP is authorised to access the remote device. Here you will also see the address of the receiver, something like spr.openport.io:12345

Now SSH in to the Pi using the spr.openport.io as the address and the digits after the : as the port.

On Windows machines you'll need PuTTY, on Mac or Linux just use a shell (command prompt window) `SSH xxx@spr.openport.io:12345`
