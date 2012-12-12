---
layout: default
category: it/technical/language/java
title: "JavaHarmony"
tags:  JVM Harmony JDK Java
---

#JavaHarmony#



##[ReadingRes](http://www.ibm.com/developerworks/cn/java/j-harmony/)##



##Background##
* Aim
  * 开发出一个独立并且与现有 JDK 兼容的 Java SE 5 实现，并且以 Apache 软件许可证 2.0 版发行
  * 建立一个开放的模块化运行时架构，包括虚拟机和类库之间及其内部的模块化，并通过这个平台，允许社区在此基础上自由定制自己的 Java 实现，或者对某个模块单独进行创新
* Structure
  * ![StructureImage](http://www.ibm.com/developerworks/cn/java/j-lo-harmony1/images/image002.jpg)
  * ThreeLevels
    * OS
    * JVM
    * Java Library
  * Feature
    * 虚拟机和类库内部被高度模块化
      * Library
        * 类库在功能和 Java Package 的基础上被分成 31 个模块
      * JVM
        * JIT
        * MemoryManager
        * ThreadManager
        * JNI
      * 每个模块都有一定的接口定义，从而有可能单独被替换成不同的实现
    * Port Layer
      * 操作系统层次与虚拟机层次之间的接口
      * 封装了不同的操作系统的差异，为虚拟机和类库的本地代码提供了一套统一的 API 访问底层系统调用。
    * VMI(加入了一层虚拟机接口加入了一层虚拟机接口)
      * 主要由内核类（Kernel Class）和本地代码 VMI 组成
      * 实现了虚拟机接口的虚拟机实现都可以使用 Harmony 的类库实现，并且可以被 Harmony 提供的同一个 Java 启动程序启动



##tags: JVM Harmony JDK Java##
