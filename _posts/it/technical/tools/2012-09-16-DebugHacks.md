---
layout: default
category: it/technical/tools
title: "DebugHacks"
tags:  system debug 经验
---

#DebugHacks#



##思路图##
* Image
* Invoke API
  * Debug API
    * valgrind
    * dump
  * System status API
    * proc
    * sys
  * System API
    * Invoke function
* 目录



##心得##
* 复现
  * 之前
    * 配置环境
    * 听取发现人的意见(先自己总结)
    * 再次检查环境
  * 之后
    * 确认现象
    * 确认复现率和时间
* 分析时
  * 目视确认现象
  * 尽量缩小范围
  * 根据内核配置、内核启动参数划分问题
  * 根据版本划分问题
  * 通过其他方法确认
    * lsusb
    * lsof
    * ip
    * route
  * 根据事实做出判断
* 问题原因不明
  * 怀疑硬件问题
  * 找找以前改正的同类错误
  * 无法复现、原因不明
    * 增加log、方便下次定位
  * 为bug发生做准备
    * log
    * abort
    * assert
  * 跟同事讨论
  * 咨询社区



##Basic##
* CoreDump
  * OpenUse
    * ulimit -c unlimited
    * ulimit -c 1024
    * ./a.out
    * file core*
    * gdb -c core.xxxx ./a.out
  * OpenSystem
  * Space
    * ToSpecialDir
    * tar
    * MaskSharedMemoryDump
* gdb
  * run
  * break
    * function
    * line-number
    * file:line
    * file:function
    * +offset
    * -offset
    * *addr
  * backtrace
  * print
  * info reg
  * continue
  * next
  * step
  * set variabel var=exptr
  * generate-core-file
  * attach
  * break xxx if exptr
  * ignore breakpoint-number times
  * clear
    * all(no arg)
    * function
    * line
    * file:line
    * file:func
  * delete bpn
  * disable
    * all(no arg)
    * bpn
    * display xxx
    * mem 



##应用程序调试##
* SIGSEGV
  * 系统层面的signal
  * Maybe
    * StackOverflow
    * WrongAddressAccess
      * NULL-pointer
      * Wrong-Pointer
      * OutOfBound-Memory
* backtrace无法显示
  * Reason
    * 程序栈被破坏
    * so没有源程序
  * Find
    * 根据被破坏的数据内容，查找执行写入的位置，看看有没有对栈空间(局部变量)的引用、指针传递处理
* watch *addr
* malloc/free
  * MALLOC_CHECK_



##tools##
* strace
  * std:run with kernel invoke
  * -i: run with addr
    * gdb break by addr
  * -p pid
* objdump
* valgrind
  * check
    * memory leak
    * wrong address access
    * read uninited memory
    * access free mem
    * double free
    * stack error opt



##tags: system debug 经验##
