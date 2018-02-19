#### Magisk WiFi Bonding

Make 2.4Ghz/5Ghz WiFi running at 40Mhz on your Qualcomm devices!

This module could work on most of the devices. By default, some devices provided an ini file to control thewifi behavior. This module modified the `WCNSS_qcom_cfg.ini` in order to support 40mhz. The basic logic is simple, but not all devices need such kind of module. If you can find `WCNSS_qcom_cfg.ini` in your system partition, please open an issue to report it to me; if you can't, this module won't work for you, including almost all Nexus/Pixel devices.

#### NOTICE

* You should use latest Magisk Manager to install this module. If you meet any problem under installation from Magisk Manager, please try to install it from recovery.
* Recent fixes:
Add more file paths (prima)

#### Credit & Support

* Copyright (C) 2017 simonsmh <simonsmh@gmail.com>
* Any issue or pull request is welcomed.
* Star this module at [GitHub](https://github.com/Magisk-Modules-Repo/magisk-wifi-bonding).
