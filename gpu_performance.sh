#!/bin/bash
echo 's 0 1103 875' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 1 1103 875' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 2 1103 875' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 3 1103 875' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo 's 4 1103 875' >  /sys/class/drm/card0/device/pp_od_clk_voltage
echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo "2" >  /sys/class/drm/card0/device/pp_dpm_mclk

