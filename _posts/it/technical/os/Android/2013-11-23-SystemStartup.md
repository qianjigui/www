---
layout: post
lmtime: 2014-01-03
category: it/technical/os/Android
title: "SystemStartup"
tags: undefine

---
#SystemStartup#



##1. 上电##



##2. Chip##



##3. 存储区固定区域Load##
* MBR
* SF/MMC/NAND Area
  * fastboot
  * bootargs
  * recovery
* 以HISI3716CV100为例
  * spi
    * fastboot
    * bootargs
    * recovery
    * deviceinfo
  * nand
    * misc
    * kernel
    * system
    * userdata



##4. long jump to uboot##



##5. uboot/fastboot##
* bootargs
* bootcmd
  * load kernel from NAND to MEMORY
  * bootm @MEMORY
* recoveryargs



##6. Kernel Mode##
* System Init
  * Memory
  * Device load
* Linux mode



##7. Linux Mode##
* Parse init.rc
  * default service
* app_process
  * Android loading



##8. Android Mode##
* Zygote
* System_server
  * service ready
    * ActivityManager
    * WindowManager
    * PowerManager
    * PackageManager
    * InputManager
  * Lauch App
