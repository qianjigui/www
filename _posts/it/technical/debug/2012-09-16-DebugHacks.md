---
layout: default
category: it/technical/debug
title: "DebugHacks"
tags:  Tool

---
#DebugHacks#



##思路图##
* Image
  * ![Don't Response](http://pic.yupoo.com/qianjigui/ClqS2IyK/medish.jpg)
  * ![AppExitUnUsual](http://pic.yupoo.com/qianjigui/ClqS39ys/medish.jpg)
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
  * http://book.douban.com/subject/6799412/



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



##Android系统死机调试##
* 发生死机时的测试
  * 看屏幕与按键是否有反应
  * 电话可否打入
  * USB可否连接
* USB测试
  * 是否有事件产生
  * 系统状态
    * CPU
    * Memory
    * Mount size
  * SystemServer状况
    * 信号级别调试



##Unix##
* Crash
  * Core dump
  * ulimit
    * 设置和查看用户的使用的资源限制情况
* 内存泄露
  * Purify
  * valgrind
  * free
* 性能不满足预期
  * prtdiag
  * prstat
  * top
  * ps
    * ps -e -o user,pid,ppid,tid,time,%cpu,cmd --sort=%cpu
* 句柄泄露
  * iostat
    * 报告中央处理单元（中央处理器）统计和输入 / 输出设备和分区统计
  * lsof
* Others
  * nm
    * 显示目标文件的符号表信息
  * ldd –显示动态库的依赖信息
  * pstack（Solaris， Linux）， procstack（AIX）– 打印十六进制地址和符号名称
  * pmap(Solaris, Linux), procmap(AIX) –打印地址空间映射
  * pldd(Solaris), procldd(AIX) —列出进程加载的库
  * pfiles(Solaris), procfiles(AIX)– 报告有关的所有文件描述符
  * prstat(Solaris), ps -e -o user,pid,ppid,tid,time,%cpu,cmd –sort=%cpu(Linux)– 检查每个线程的处理器
  * pwdx（Linux，Solaris）  pid 显示当前工作目录
* ![UnixProfile](http://pic.yupoo.com/qianjigui/CIwePulE/11Uyc9.jpg) 



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



##tags: Tool##
