---
layout: post
lmtime: 2014-01-03
category: it/technical/os/Android
title: "Android Build System"
tags:  Make

---
#Android Build System#



##Global Structure##
* main.mk
  * 75. help.mk
    * make help
    * make out
  * 79. config.mk
    * 全局常量定义
      * compile
        * tools
    * 2.1 cts/build/config.mk
    * 2.2 build/buildspec.mk
    * 2.3 envsetup.mk
      * 2.3.1 version_defaults.mk
      * 主要是系统环境设置
        * arch
          * arm
          * x86
        * platform
          * windows
          * linux
        * output directory
          * out/target...
      * 2.3.2 product_config.mk
        * 2.3.2.2 product.mk
          * var PRODUCT_PACKAGES
        * 2.3.2.3 device.mk
        * 2.3.2.4 product/AndroidProducts.mk
          * define PRODUCT_PACKAGES
  * 85. cleanbuild.mk
    * make clean
  * 236. definitions.mk
    * define helper functions, vars
  * 239. dex_preopt.mk
    * Dex preopt
  * 273. pdk_config.mk
    * The pdk (Platform Development Kit) build
  * 458. ONE_SHOT_MAKEFILE 
  * 487. post_clean.mk



##mm##
* ONE_SHOT_MAKEFILE=$M $DRV make -C $T -f build/core/main.mk all_modules $@
  * 注意这个命令的结构：最前面是个赋值语句(ONE_SHOT_MAKEFILE=xxx/Android.mk) 后面是一个包装make的运行调用
    * $DRV make -C $T -f build/core/main.mk all_modules $@ ONE_SHOT_MAKEFIKE=xxx/Android.mk
  * 参数作用
    * $M: 相对根目录的Android.mk文件路径
    * $DRV: 运行后面命令的封装程序
      * scan-build: running the analyzer from the command line
      * 一般只是简单的调用后面参数中的命令
    * -C 在Android根目录运行
    * -f 目标makefile文件
    * all_modules 运行目标
    * $@ 后面的传入参数
  * all_modules
    * define @ base_rules.mk
    * LOCAL_MODULE



##BUILD_PREBUILT##
* main.mk
* prebuilt.mk



##新功能方向与学习##
* DexpreoptForPREBUILTmodules
  * APP build 涉及模块的作用
  * 去掉system下的so
* AddNewGlobalVariable
* AddNewProject



##tags: Make##
