---
layout: default
category: it/technical/os/Android
title: "SystemServer"
tags: undefine
---

#SystemServer#



##PackageManagerService##
* http://blog.sina.com.cn/s/blog_3e3fcadd01014678.html
  * PackageManger
  * Permission
* Main Tasks
  * 建立installer与installd的socket连接
  * 建立PackageHandler消息循环: 用于处理外部的apk安装等请求
  * 解析/system/etc/permissionsetc/permissions/"（一般就是/system/etc/permissions）下的各个.xml文件中读取系统的基本permissions，而且文件platform.xml在最后读，表明其优先级最高
    * Android的基本permission、Linux gid(s)、以及它们的对应关系 -- mSettings.mPermissions， mGlobalGids
    * 为Android permission指定的Linux uid   --  mSystemPermissions
    * 为Android所增加的应用需要链接的java库的名称和全路径  --  mSharedLibraries
    * 系统所支持的各种硬件模块的feature(未见具体实例，据代码可知，这只是一个名字) -- mAvailableFeatures
  * 解析/data/system/packages.xml文件
  * 对jar进行dexopt优化
  * 通过ScanDirLI()扫描并解析当前已存在的apk
  * 将解析/安装的.apk信息保存到/data/system/packages.xml和/data/system/packages.lst文件以备查询
