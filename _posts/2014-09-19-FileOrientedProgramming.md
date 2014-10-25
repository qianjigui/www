---
layout: post
lmtime: 2014-10-25
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



##Linux API##
* http://book.douban.com/subject/1241402/
* 整体层次
  * RAID
  * LVM
  * Linux VFS
  * FileSystem
    * ext2
    * JFS
    * ReiserFS
    * XFS
* 主要功能
  * 创建与删除文件
    * 分配和取消存储媒体上的空间
    * 资源的管理
  * Read/Write
  * Search
  * Close
  * mkdir
  * ls dir
  * rm file from dir
* 为性能而生的缓冲区
* 文件系统中的对象与API
  * 文件
    * struct fown_stuct
    * struct file
    * API
      * llseek
      * read
      * write
      * readdir
      * poll
      * ioctl
      * mmap
      * open
      * flush
      * release
      * fsync
      * fasync
      * check_media_change
      * revalidate
      * lock
  * 信息节点
    * struct inode
    * API
      * default_file_ops
      * create
      * lookup
      * link
      * unlink
      * symlink
      * mkdir
      * rmdir
      * mknod
      * rename
      * readlink
      * follow_link
      * get_block
      * readpage
      * writepage
      * flushpage
  * 文件系统
    * struct file_system_type
    * API
      * register_filesystem
      * unregister_filesystem
  * 名称/dentry
    * struct qstr
    * struct dentry
    * API
      * d_revalidate
      * d_hash
      * d_compare
      * d_delete
      * d_release
      * d_iput
* 主要的性能问题
  * 目标
    * 减少基本设备上的IO数量
    * 将小型IO组合成大型IO
    * 优化搜索模式, 减少等待磁盘搜索所花的时间
    * 缓存尽可能多的数据, 以减少物理IO
  * 事务体系
    * 记录事务的开始
    * 在更改数据之前记录将要更改的数据
    * 从存储库中访问数据库记录
    * 对数据的不同操作
    * 在更改数据之后记录已经做了更改的数据
    * 记录事务的结束



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
