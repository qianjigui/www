---
layout: default
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



##Thinking Pattern##
* Tip
  * Project
  * Design Patterns
  * VM
