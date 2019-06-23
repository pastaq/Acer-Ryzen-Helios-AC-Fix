# amdgpu-powersave

## Purpose
Acer Predator Helios 500 Ryzen edition notebooks do not detect the AC adapter as being plugged in in Linux, forcing the system into a low power state and robbing performance from the system. This workaround sets the GPU to increased clocks on login to improve performance. 

## Installation

### Set kernel flags to enable AMDGPU overclocking.
Using your prefered editor modify your grub to include the ppfeaturemask flag that enabled AMDGPU overclocking. I have used nano in this example.

`sudo nano /etc/default/grub`

add `amdgpu.ppfeaturemask=0xffff7fff` to the line `GRUB_CMDLINE_LINUX_DEFAULT`

```
sudo update-grub
reboot
```

### Move the files to the required directories.
Clone the repository

```
cd <clone dir>
sudo cp gpu_performance.sh /usr/local/sbin/
sudo cp gpu_powersave.sh /usr/local/sbin/
sudo cp gpu_toggle.service /etc/systemd/system/
```

## Using the Service

To have the system automatically start in performance mode:
`sudo systemctl enable gpu_toggle`

To manually enable performance mode:
`sudo systemctl start gpu_toggle`

To manually disable performance mode:
`sudo systemctl stop gpu_toggle`

### Other tricks.

Users have reported that unplugging and replugging the power cable will reenable the CPU performance of the system. Some distributions do not enable acpid by default, preventing this workaround from working. To resolve ensure acpid is installed and enabled on your system. Refer to your vendor documentation.

To see if you are running in powersave mode on the cpu run the following command
`cat /proc/cpuinfo | grep MHz`
normal output will be between 1500MHz and 3200MHz. Low Power mode will be around 550MHz on all cores.

## Disclaimer
This will overclock your GPU. Any damage resulting from you running this service is your own damn fault. Leave me alone about it.






