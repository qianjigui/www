---
layout: post
lmtime: 2014-01-01
category: it/technical/vm
title: "VM-Group-Discuss"
tags: undefine

---
#VM-Group-Discuss#



##Memory##
* Heap
  * ConstPool
    * StaticField
      * Direct reference
        * object
      * Reflect
        * ClassObject
        * java.lang.reflect.Field
        * Other
          * GC
          * Relink
          * Reinit
      * eg: http://hllvm.group.iteye.com/group/topic/34986
  * G1@java7u4
    * https://oracleus.activeevents.com/connect/sessionDetail.ww?SESSION_ID=6583
    * http://www.infoq.com/cn/articles/jdk7-garbage-first-collector
      * 特点 
        * 并行
          * ScanMark run with other app threads
        * 并发
          * Remark step run in multi threads
          * Clean step run in multi threads
        * 分代
        * 空间整合
          * Multi Regions
          * Region Level Clean
            * Reference set loging linking from other region(write barrier)
        * 可以预测的停顿
          * Clean some regions by its needing time
      * Running
        * ![Steps](http://www.infoq.com/resource/articles/jdk7-garbage-first-collector/zh/resources/image1.jpg)
* Native
  * NIO-directMemory
    * http://hllvm.group.iteye.com/group/topic/35271
  * ByteBuffer.allocateDirect 



##JavaByteCode##
* Class Static Scope Codes
  * Generate <cinit>{}
    * 只能作为类加载过程的一部分由JVM直接调用
    * http://hllvm.group.iteye.com/group/topic/35224



##JVMDebug##
* 为什么 Java 会 Crash？
  * http://www.linuxeden.com/html/softuse/20120506/123909.html
  * Problems
    * JVM bug
    * Native library bug
    * Java code bug
    * Native memory left NONE
    * Environment effect
      * OOM Killer
  * Crash
    * JVM意外消失
    * crash log
      * core.pid
      * core dump
    * tools
      * jstack/gdb
