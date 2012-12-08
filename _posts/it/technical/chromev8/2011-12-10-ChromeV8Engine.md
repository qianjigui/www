---
layout: default
category: it/technical/chromev8
title: "JS-V8引擎"
---

#JS-V8引擎#
##设计理念##
*  译文地址 [V8 Javascript 引擎设计理念](http://blog.pluskid.org/?p=186)
*  快速属性访问
  *  动态地为对象创建隐藏类
    *  当一个新的属性被添加到对象中时，对象所对应的隐藏类会随之改变。
    *  属性访问不再需要动态字典查找了 
    *  为 V8 使用经典的基于类的优化和内联缓存技术创造了条件。 
  *  利用类转移信息，隐藏类可以被重用。 
*  动态机器码生成
  *  V8 在第一次执行 JavaScript 代码的时候会将其直接编译为本地机器码，而不是使用中间字节码的形式，因此也没有解释器的存在。
  *  属性访问由内联缓存代码来完成，这些代码通常会在运行时由 V8 修改为合适的机器指令。
*  高效的垃圾收集
  *  在执行垃圾回收的时候会中断程序的执行
  *  大部分情况下，每个垃圾收集周期只处理整个对象堆的一部分，这让程序中断造成的影响得以减轻。
  *  总是知道内存中所有的对象和指针所在的位置，这避免了非 accurate 的垃圾收集器中普遍存在的由于错误地把对象当作指针而造成的内存溢出的情况。
  *  在 V8 中，对象堆被分成两部分：用于为新创建的对象分配空间的部分和用于存放在垃圾收集周期中生存下来的那些老的对象的部分。如果一个对象在垃圾收集的过程中被移动了，V8 会更新所有指向这个对象的指针到新的地址。
##API##
*  基本概念 http://www.2009fly.com/index/a/bianchengyuyan/javascript/V8_Javascript_Engine/2011/0326/844.html
  *  句柄（Handle）
    *  从实质上来说，每一个句柄就是一个指向v8对象的指针，所有的v8对象必须使用句柄来操作。
    *  如果一个v8对象没有任何句柄与之相关联，那么这个对象很快就会被垃圾回收器给干掉（句柄跟对象的引用计数有很大关系）。
    *  具体使用
      *  Local
        *  存放在函数调用栈中
          *  HandleScope
            *  只能通过栈申请，不能使用new
        *  Local<SomeType>
          *  父类 Handle<SomeType>
      *  Persistent
        *  申请 Persistent::New 
        *  释放 Persistent::Dispose 
        *  Persistent<SomeType>
          *  父类 Handle<SomeType>
  *  作用域（Scope）
    *  从概念上理解，作用域可以看成是一个句柄的容器，在一个作用域里面可以有很多很多个句柄（也就是说，一个scope里面可以包含很多很多个v8引擎相关的对象）
    *  句柄指向的对象是可以一个一个单独地释放的，但是很多时候（尤其是写一些“有用”的程序的时候），一个一个地释放句柄过于繁琐，取而代之的是，可以释放一个scope，那么包含在这个scope中的所有handle就都会被统一释放掉了。
  *  上下文环境（Context）
    *  可以理解为运行环境
    *  在执行javascript脚本的时候，总要有一些环境变量或者全局函数。
*  API实例 http://www.cppblog.com/corelito/category/8535.html
  *  全局模板（Global Template） http://www.cppblog.com/corelito/archive/2008/10/19/64435.html
    *  构造一个自己系统需要的环境
  *  访问器——访问脚本中的变量 http://www.cppblog.com/corelito/archive/2008/10/19/64445.html
    *  提供哦你数据访问的接口
  *  自定义函数-打印 http://www.cppblog.com/corelito/archive/2008/10/20/64545.html
    *  扩展函数
  *  使用访问器访问 C++ 对象 http://www.cppblog.com/corelito/archive/2008/10/23/64654.html
    *  相互访问
*  关键技术
  *  相互调用与通信
  *  数据共享
##JS引擎基本##
*  已经成为一个独立的基础平台而单独存在
*  API的基本要求
  *  数据类型可操作
  *  运行时环境可控制
  *  数据对象集合可管理
  *  可以执行函数与脚本
  *  支持String操作
    *  字符串基本操作
    *  正则表达式引擎
  *  错误处理
  *  安全控制
  *  Debug支持
