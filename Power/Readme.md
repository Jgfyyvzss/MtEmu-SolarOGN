# Power Supply Info

There are several components in the power supply:

* Solar panel
* Deep cycle SLA battery
* Charge controller
* 5V power supply to Witty Pi & so to RPi
* 5V power supply to peripherals via powered USB hub - RTL-SDR and Huawei modem

The solar panel is straightforward - pretty much the biggest you can fit/afford.

Battery - I am weight constrained by the tower arrangement so chose a 15Ah battery as a reasonable compromise of weight : duration : cost

### Charge controller
Ebay MPPT controller with 2A USB outlet. I am not using the USB outlets as 2A isn't really adequate for the Pi + RTL-SDR
![Ebay MPPT charge controller with USB](/Power/MPPT_ebay.JPG)

### 5V power to Witty / Pi
I started with an ebay 12V to 5V waterproof step down converter provides power to the Witty, and so to the Pi and RTL-SDR. Unfortunately the output is 4.97V so the Pi complains of low voltage.
I'm now changing that to an XL4005 based adjustable supply, same as described below.
![Ebay 12V to 5V step down](/Power/5v_usbc.jpg)

### 5V power to USB hub. 
I started trying a generic fixed/adjustable 5V 3A step down power supply with an enable input. Unfortunately that had Enable low so I would have needed to build an signal inverter. 
The better solution is (hopefully) to change to an XL4005 based power supply with Enable High, allowing the Witty provide the power on signal when it turns on the Pi each morning.
I will need to cut a trace or leg to be able to connect the Enable pin to the Pi, as delivered they are permanently pulled high. Should be easy enough.

![XL4005](/Power/XL4005.JPG)
