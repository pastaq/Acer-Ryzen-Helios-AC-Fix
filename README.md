# Acer Ryzen Helios AC Fix

## Purpose
Acer Predator Helios 500 Ryzen edition notebooks do not detect the AC adapter as being plugged in in Linux, forcing the system into a low power state and robbing performance from the system. This workaround diables the buggy power states on login to improve performance.

The upstream bug report is [drm/amd#999](https://gitlab.freedesktop.org/drm/amd/-/issues/999), and its resolution would obsolete this workaround.

## Installation

### Set kernel flags to enable DPM manual state changes.
Using your prefered editor modify your grub to include the ppfeaturemask flag that enabled AMDGPU overclocking. I have used nano in this example.

`sudo nano /etc/default/grub`

add `amdgpu.ppfeaturemask=0xffff7fff` to the line `GRUB_CMDLINE_LINUX_DEFAULT`

```
sudo update-grub
reboot
```


## Systemd

### Move the files to the required directories.
Clone the repository, then link the files in the appropriate system locations:

```
cd <clone dir>
sudo ln acfix.sh /usr/local/sbin/
sudo ln acfix.service /etc/systemd/system/
```

(If your root filesystem and clone partition differ, use `cp` instead of `ln`.)

## Using the Service

To enable the workaround:
```
sudo systemctl enable acfix
reboot
```

## Disclaimer
Any damage resulting from you running this service is your own damn fault. Leave me alone about it.
