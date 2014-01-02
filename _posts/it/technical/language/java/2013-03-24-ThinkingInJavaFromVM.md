---
layout: post
category: it/technical/language/java
title: "ThinkingInJavaFromVM"
tags:  VM Java

---
#ThinkingInJavaFromVM#



##tags: VM Java##



##创建和销毁对象##
* 考虑用静态工厂方法代替构造器
  * 命名与创建更有意义
  * 工厂模式
    * Meaning
    * 集中管理
  * Constructor
    * javac
      * <init>
      * <cinit>
    * VM
      * 类信息布局与管理
        * Structure
          * Methods
          * Fields
        * LinearAlloc
          * For native
          * Methods
          * Fields
        * ClassObject In Heap
          * reference to LinearAlloc data
* 遇到多个构造器参数时要考虑用构建器
  * 不要简单通过参数进行控制
  * 工厂
* 用私有构造器或者枚举类型强化Singleton属性
  * 保证单一性
  * 单例模式
    * sync
  * VM
    * 访问控制
* 通过私有构造器强化不可实例化的能力
  * VM
    * 访问控制
* 避免创建不必要的对象
  * 内存与单一性
    * for ==
    * Not equals
  * API
    * String.intern
    * 工厂模式
* 消除过期的对象引用
  * static field
  * GC
* 避免使用终结方法
  * finalize的调用不可预期
  * Dalvik
    * libcore reference support
      * Reference Class
        * VM internal field
          * queueNext
            * 相关类型对象的单链表用于记录
          * pendingNext
            * 进行处理的表
    * MarkSteps
      * Check Prevserve SoftReference
        * Mark SoftReference Objects
      * clearWhiteReference
        * softReference
        * weakReference
      * enqueueFinalizerReferences
        * Enqueues finalizer references with white referents 
        * White referents are blackened, moved to the zombie field 
        * the referent field is cleared 
      * clearWhiteReference
        * softReference
        * weakReference
        * phantomReferences



##Thinking Pattern##
* Tip
  * Project
  * Design Patterns
  * VM



##对于所有对象都通用的方法##
* 覆盖equals时请遵守通用约定
  * if(x!=NULL) x==x true
  * x and y are not NULL, x==y if and only if y==x
  * x,y,z NOT NULL, x==y y==z => x==z
  * if(x!=NULL) x==NULL return false
* 覆盖equals时总要覆盖hashCode
  * Dalvik
    * MarkSweep GC
      * Object hashcode==object addr
    * Copying GC
      * Object hashcode is saved in the object
* 始终要覆盖toString
  * For Debug
* 谨慎地覆盖clone
* 考虑实现Comparable接口 



##类和接口##
* 使类和成员的可访问性最小化
* 在公有类中使用访问方法而非公有域
  * Getter and Setter
* 使可变性最小化
  * Clone argument in constructor
* 复合优先于继承
* 要么为继承而设计，并提供文档说明，要么就禁止继承
* 接口优于抽象类
* 接口只用于定义类型
* 类层次优于标签类
* 用函数对象表示策略
* 优先考虑静态成员类



##方法##
* 检查参数的有效性
  * assert
* 必要时进行保护性拷贝
  * For construcor with object argument
* 谨慎设计方法签名
* 慎用重载
* 慎用可变参数
* 返回零长度的数组或者集合，而不是：null
* 为所有导出的API元素编写文档注释



##通用程序设计##
* 将局部变量的作用域最小化
  * Dalvik dex
    * Share stack Vars
      * by javac
* for-each循环优先于传统的for循环
  * by javac
* 了解和使用类库
  * java.lang.*
  * java.util.*
* 如果需要精确的答案，请避免使用float和double
  * BigDecimal
* 基本类型优先于装箱基本类型
  * final field for value
* 如果其他类型更适合，则尽量避免使用字符串
* 当心字符串连接的性能
  * StringBuffer
* 通过接口引用对象
* 接口优先于反射机制
  * Dalvik
    * Reflect
      * By JNI
* 谨慎地使用本地方法
  * JNI
    * Dalvik
      * Native stack is managed by coder
        * Local Reference
        * Global Reference
* 谨慎地进行优化
  * By profile
* 遵守普遍接受的命名惯例



##异常##
* 只针对异常的情况才使用异常
  * 空间局部性
    * Dalvik
      * Try-Catch
        * Check Have exception
        * Find Catch area
          * Jump in Stacks
        * Run
* 对可恢复的情况使用受检异常，对编程错误使用运行时异常
* 避免不必要地使用受检的异常
* 优先使用标准的异常
* 抛出与抽象相对应的异常
* 每个方法抛出的异常都要有文档
* 在细节消息中包含能捕获失败的信息
* 努力使失败保持原子性
* 不要忽略异常
