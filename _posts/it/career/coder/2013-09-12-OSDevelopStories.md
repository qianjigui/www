---
layout: default
category: it/career/coder
title: "OSDevelopStories"
tags:  OS Review

---
#OSDevelopStories#



##YunOS##
* 201303
  * APIChecker
    * 用于解决云OS升级过程中的API兼容性问题
    * 理论上可行，但无法落实且没有整合到系统中用于编译期間的检查
* 201304
  * OS 稳定性问题
    * Runtime自身问题
      * TVM
      * 多线程的不安全
        * 数据结构线程安全性API的封装
          * HashTable
        * Global Data
          * Heap
      * 出现异常情况后没有及时Crash
        * GlobalReference Full
      * API与原系统不统一
        * DexFile Exception
    * 系统调试接口使用不够
      * MTKLog
        * AEE
        * Log View Tool
        * Kernel Log
      * Monkey Log
      * Linux Tools
        * getevent
        * dumpsys
      * Android System Structure
        * system_server
          * services
            * InputSystem
            * PowerManager
            * ActivityManager
            * PackageManager
        * App Names Change
      * How To Root
* 201305
  * Codebase
    * AAPT
    * Android Make System
      * make
    * Java annotation
    * Java preprocessor
* 201306
  * Project CR
    * CR Helper System
    * LDAP
    * RoR
* 2013
  * 应用兼容性问题
    * 对比测试
    * 与Android API的兼容性
* 201308
  * OSUpdate
    * 兼容性
      * App Data
        * HomeShell
          * Layout
          * icons
        * Contact
          * Database column change
    * 结构调整
      * TVM
        * Remove all libcore
        * lar 2 apk
          * fota patch
        * lemur-cache 2 dalvik-cache
          * rc delete_recursive
  * OS稳定性问题
    * mediatek update
      * structure
      * AEE feature
      * driver porting
* 201309
  * MTK AEE Feature Study
  * TV OpenBase
    * Get information from Android Build system
    * Copy
      * binaries
        * depend information
        * Android.mk
          * APPS
            * signature
      * intermediate files
    * make system
      * include
* 201310
  * BinaryGen
    * BinaryGen
  * HIMEDIA Q12
* 201311
  * BinaryGen
    * OpenbaseGen
    * GerritCheck
  * HISI3718
* 201312
  * BInayGen
    * MirrorGen
    * Training
    * dexpreopt
      * AndroiBuildSystem
        * 关注于整体系统结构，主要解决的问题
    * InternalUse
      * HowToMakeATeam
        * 团队没有继承性
          * 精神
          * 技术文档与基础培训
        * 团队因为工作内容没有状态
          * 将无趣的工作有有趣化
          * 加强培训与创新
            * 将无趣的工作分离出来
            * 工作自动化
  * LeadingProduct
    * 把握与了解整体Android系统
    * 具体的调试技术，方案选型



##tags: OS Review##
