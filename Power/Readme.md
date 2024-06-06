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
An ebay 12V to 5V waterproof step down converter provides power to the Witty, and so to the Pi and RTL-SDR. Unfortunately the output is 4.97V so the Pi complains of low voltage. But it runs. I'll probbaly update it to an adjustable regulator so I can set it to Pi's preferred 5.1V

### 5V power to USB hub. 
I'm trying a generic fixed/adjustable 5V 3A step down power supply with an enable input. By connecting the enable to the Witty VOUT 5V it should turn on when the Pi does. There could be some difficulty getting a common ground for this because the Witty uses CATHODE as ground for the Pi power not the ground from the battery or USB supplying it. The Witty already has a 0.05 ohm resistor between CATHODE & GROUND, so I'm thinking it should be OK to tie the battery and 5V power supply grounds together and put a resistor between VOUT and ENABLE provide the 1-2V signal the ENABLE pin probably requires.

My electronics skills are't great so I could be wrong about this common ground stuff. 

![5V power supply with Enable](/Power/5V_with_enable.png)
