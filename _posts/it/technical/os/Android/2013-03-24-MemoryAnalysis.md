---
layout: default
category: it/technical/os/Android
title: "AndroidOSMemory分析"
tags:  Android OS Memory Heap
---

#AndroidOSMemory分析#



##内存使用分析##
* DDMS
  * Heap
    * Hprof
      * MAT
        * OQL
          * http://qianjigui.iteye.com/blog/1706898
        * http://qianjigui.iteye.com/blog/1706773
    * Heap Info
    * Alloc Tracker
* Linux Tools
  * procrank
  * ps
  * smaps
    * http://qianjigui.iteye.com/blog/1479109
  * meminfo
* Native Malloc
  * Malloc-Debugger



##OS Strategy##
* Android OOM Strategy
  * OOM Killer
    * Six Levels
      * FOREGROUND_APP — The application you are currently using 
      * VISIBLE_APP — An application that is visible but not in the foreground 
      * SECONDAY_SERVER — A process providing services
      * HIDDEN_APP — A process that is hidden, but may be needed by a running program
      * CONTENT_PROVIDER — Apps that provide data to the system (for example, synchronizing with the Market)
      * EMPTY_APP — An application you were using, but is not currently active
  * Strategy
    * http://blog.csdn.net/wuhengde/article/details/8104029
    * ProcessList.java
    * ActivityManagerServer.java
* CopyOnWrite
  * Zygote fork
    * Preload
      * classes
      * Resources
* IPC
  * Binder



##App Strategy##
* 对象的组合
  * 生命周期
    * 相近的最好一起申请
  * 设计
    * 早清空
      * static
    * finalize少使用
    * SoftReference
      * 处理资源
        * image
    * String.intern
* 整体结构
  * 模块化，可分批load
* API
  * Preload



##tags: Android OS Memory Heap##
