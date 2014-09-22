---
layout: post
lmtime: 2014-09-22
category: it/technical/design
title: "FileOrientedProgramming"
tags:  DesignPattern IO

---
#FileOrientedProgramming#



##涉及API##
* path
  * filepath
* io
* filesystem API
  * http://en.wikipedia.org/wiki/File_system_API



##tags: DesignPattern IO##



##FileSystem##
* http://en.wikipedia.org/wiki/File_system
* 文件系统涉及的主要方面
  * 存储空间管理
  * 文件名称管理
  * 目录管理
  * META元数据管理
  * 文件数据 
  * UI
  * 基础工具
  * 权限管理
    * permission
  * 数据完整可信
    * 数据持久化与一致性
    * operation log
    * 错误修复
  * 多文件系统共存
    * 支持硬盘分区
  * FS API
  * 设计限制/规格
    * 例如:最大文件大小,maxfilenamelength
* 主要的类型
  * Disk
    * 有日志文件系统,版本文件系统
  * 光盘
  * Flash
  * 磁带
  * 数据库
  * 事务文件系统
  * 网络文件系统
    * SMB
    * NFS
    * AFS
    * FTP
  * 共享磁盘文件系统
  * 特殊文件系统
  * 设备文件系统
