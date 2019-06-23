#!/bin/bash
echo 's 0 150 800' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 1 882 815' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 2 914 830' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 3 931 845' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 4 950 860' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo "0 1 2 3" >  /sys/class/drm/card0/device/pp_dpm_mclk
echo "auto" > /sys/class/drm/card0/device/power_dpm_force_performance_level

