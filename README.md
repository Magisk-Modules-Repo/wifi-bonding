# Magisk WiFi Bonding

Double your bandwith on your Qualcomm devices!

[中文说明](https://github.com/Magisk-Modules-Repo-CN/magisk-wifi-bonding/blob/master/README.md)

## Details

By default, some devices provided an ini file to control the wifi behavior. This module modified the `WCNSS_qcom_cfg.ini` in order to support 40mhz.

- Make 2.4Ghz/5Ghz WiFi running at 40Mhz enabled.
```
gChannelBondingMode24GHz=1
gChannelBondingMode5GHz=1
```

- Make forced WiFi antenna 1T1R on MTK solution AP disabled.
```
gForce1x1Exception=0
```

This module should work on most of the devices. The basic logic is simple, but not all devices need such kind of module. If you can find `WCNSS_qcom_cfg.ini` in your system partition, please open an issue to report it to me; if you can't, this module won't work for you, including almost all Nexus/Pixel devices.

## Instructions

Please follow the instuction below from @axeldna:

1. Removed the installed Wifi Bonding module.
2. Removed all saved wifi 2.4Ghz networks (I removed all of them anyway, but shouldn't be necessary).
3. Rebooted the phone (to make sure wifi settings are removed from cloud account too).
4. Installed the Wifi Bonding module.
5. Rebooted the phone (as indicated by Magisk to start the module).
6. With a phone "free of wifi" and with a fresh Wifi Bonding module, I joined 2.4Ghz wifi networks.
7. Checked my newly registered 2.4Ghz networks and they are showing 150Mbps Link Speed.
8. On some MTK solution AP, they are showing 300Mbps Link Speed.

## NOTICE

* You should use latest Magisk Manager to install this module. If you meet any problem under installation from Magisk Manager, please try to install it from recovery.
* Recent fixes:
New installation logic by finding target file with GNU find.

## Credit & Support

* Copyright (C) 2017-2019 simonsmh <simonsmh@gmail.com>
* Any issue or pull request is welcomed.
* Star this module at [GitHub](https://github.com/Magisk-Modules-Repo/wifi-bonding).
