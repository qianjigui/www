---
layout: post
category: it/technical/design/memory
title: "SmallMemorySoftwarePatternsForSystemWithLimitedMemory"
tags:  System

---
#SmallMemorySoftwarePatternsForSystemWithLimitedMemory#



##tags: System##



##SmallArchitecture(小容量体系结构)##
* Problem
  * Questions
    * 如何管理整个系统使用的内存
    * Environment
      * 肉眼数据如果受到限制，会束缚整个系统
      * 组件的内存需求量会动态改变
      * 各个组件可由开发团队完成
      * 系统由多个组件构成
  * Way
    * 让每个组件管理自己的内存运用状态
    * Idea
      * 明确组件内存规格、作为一个标准
  * Consequences(結果)
    * 可以降低程序的内存需求
    * 提高程序的内存用量可预测性
    * Maybe 使程序的伸缩性更好、可用性更强
  * But
    * 需要程序员更高的素养
  * Implementation(实现)
    * Methods
      * 理念
        * 一致性
        * 责任
      * 将系统分解为独立的组件，开发时可以一块一块的设计、构造系统；借助统一的内存策略，开发时可以确保发展出来的各部分能够高效率的协同工作
    * 关键
      * 可剪裁性(Tailorability)
        * Different context, Different memory using
      * 让客户负责管理组件的内存分配
        * Programming
          * 利用Callbacks管理内存
          * 利用统一接口进行内存使用的封装(Memory Strategy)
* Specialzation Patterns (特化模式)
  * Memory Limit(内存限额)
    * Question
      * 如何在多个相互竞争的组件间分配内存
      * Environemnt
        * 系统中包含多个组件，每个组件有各自的内存需求
        * 组件的内存需求随着系统的运行而动态变化
        * 一个组件使用内存过多会影响到其他组件
        * 你可以为每个任务设置一个合理的内存上限
    * Way
      * 为每个组件设置限额，对于超出限额的分配請求，应予以拒绝
      * Steps
        * 记录当前每个组件分配的内存数量
        * 确保组件分配的内存数量不超过分配限额
        * 理想状态下应当通过“试验、检视内存用量”的方式为每个组件设定限额
    * Implementation
      * 在内存管理操作前后注入
      * 各组件管理各自的heap
      * 分享进程
  * Small Interfaces
    * Question
      * 如何减少组件接口带来的内存额外开销
      * Environment
        * 各个组件管理各自的内存
        * 组件间通过显式的接口相互通信
        * 组件间通信需要额外内存
        * 可复用接口需要泛化接口
    * Way
      * 设计出让客户可以控制数据传输的接口
      * Steps
        * 将接口间的数据传输量最小化
        * 决定数据传输的质量程度
    * Implementation
      * 传值vs传地址
      * 注意组件间交換内存
        * 策略
          * 出借
            * 客户调用“提供服务的组件”期間，由客户出借一些内存给服务提供者
          * 借入
            * 客户获得服务供应者拥有对象的访问权
          * 窃取
            * 客户接收服务供应者分配的对象，并负责归还该对象
      * 步进式接口
        * 客户进行多次调用
        * 通过iterator传送数据
        * 通过writable iterator返回数据
        * 通过return iterator返回数据 
  * Partial Failure(局部Crash,降格求全)
    * Question
      * 如何处理不可预见的内存需求
      * Environment
        * No enough memory for running system
        * 宁可在非关键任务中fail,也不要简单放弃关键任务
        * 持续不断的运行
          * 比始终完善地运行重要
          * 比系统crash重要
    * Way
      * 请确保内存用完，也要让系统处于安全状态
    * Implementation
      * 侦测内存耗尽
      * 到达安全状态
      * 释放资源
      * 降级模式
      * 未雨绸缪
  * Captain Oates(牺牲小我)
    * Question
      * 如何满足对内存的最重要需求
      * Environment
        * 许多系统都有运行在后台的组件
        * 许多系统为了提高性能，会以高速缓冲的方式存放数据
        * 与后台活动相比，用户更关心自己的工作
    * Way
      * 应该牺牲非绝对必要的组件使用的内存，以免抗拒重要的任务
    * Implementation
      * 侦测内存耗尽
      * 处理内存不足
      * 良民
  * Read-Only Memory
    * Question
      * 如何处置只读的代码和数据
      * Environment
        * 系统提供只读内存与可写内存
        * 只读内存成本更低
        * 程序通常并不修改executable code
        * 程序不修改资源文件、查找表、以及其他预初始化的数据
    * Way
      * 最好将只读的代码与数据存储在只读内存
    * Implementation
      * 存储代码
      * 在代码中包含数据
      * 将静态数据结构放入ROM
        * DES相关数据
        * sin,cos
      * 只读文件系统
      * 版本控制
  * Hooks(挂钩)
    * Question
      * 如何更改只读存储器内在信息
      * Environment
        * 正在使用ROM
        * 无法修改ROM
        * ROM中的数据需要维护与升级
        * 进行较小的修改
    * Way
      * 在RAM中，通过hooks访问只读信息，通过更改hook,以产生信息更改的假象
    * Implementation
      * 从ROM中，调用RAM
      * Extand
        * ROM objects
        * ROM Datas



##Secondary Storage(辅助存储设备)##
* Problem
  * Question
    * 一旦你用光主内存，接下来如何处理
    * Environment
      * primary storage无法满足内存需求
      * 无法降低系统的内存需求
      * 可以将辅助存储设备添加到“running system”设备上
    * Way
      * 把辅助存储设备当作运行时间的额外内存
  * Implementation
    * 高效使用辅助内存
      * 设计时需要分割什么？
        * Execute code
        * data
        * configuration information
        * Or other mix-parts
      * 哪个层次进行分割
        * Coder
        * System
        * User
      * Who do loading and unloading
        * Coder
        * System
        * User
      * When do loading/unloading
* Specialzation Patterns
  * Application Switching(任务转换)
    * Question
      * 面对提供许多不同功能的系统，如何降低其内存需求
      * Environment
        * 系统太庞大，主内存无法容纳全部代码与数据
        * 用户经常一次只需要运行一项任务
        * 单一任务只需要自己的代码和数据就能运行，其他代码和数据可以存放在辅助存储设备内
        * 一次只编写一组相关任务更容易
      * Way 
        * 把系统分割成独立模块，每次只运行一个
    * Implementation
      * 关键问题
        * 进程间的通信
      * Rules
        * 进程间的控制流必须简单
        * 进程间尽量不传递短暂性数据
        * 分割必须对用户有意义
      * Methods
        * 程序链(Program chaining)
          * 程序间转换方便
        * Master Program(主控程序)
        * 进程间通信(InterProcess Communication, IPC)
        * 管理数据
  * Data Files(纯数据文件)
    * Question
      * 主内存无法容纳全部数据
      * Way
        * 一次只处理一部分数据
    * Implementation
      * 主要操作
        * 简单循序输入(依次读取各章)
        * 简单循序输出(依次写入文件)
        * 随机访问(读取交叉参考文件)
        * 循序输出至数个文件(利用临时文件)
      * Methods
        * 增量式处理
        * 子文件处理
        * 随机访问
          * 利用索引
  * Resource Files(纯资源文件)
    * Question
      * 如何管理为数众多的配置数据
      * Environment
        * 很多程序数据是一些只读配置信息，程序不可更改
        * 配置数据通常比代码变化频繁
        * 数据可能被程序的不同phases取用
        * 任何时候你都只需要少数数据
        * 文件系统支持随机访问
      * Way
        * 在辅助存储设备内保存配置数据，必要时才load/unload其中一项
    * Implementation
      * 必须让程序员得以轻松运用
      * 运用资源文件，节约内存
      * 字体文件
      * 实现一个资源文件系统
  * Packages(封包)
    * Question
      * 如何管理有许多可选组件的大型程序
      * Environment
        * 内存有限
        * 功能不会全部用到
        * 不同功能组合使用
        * 组件相互有分隔，发展更顺利
      * Way
        * 把程序分解为多个packages,只在系统需要具体的package时才装载
    * Implementation
      * Need
        * 需要一个能够装载组件的系统
        * 系统可以分割成模块，分别运行
        * 可动态装载
      * Methods
        * 把进程视为packages
        * 利用动态链接库
        * 功能代码分块
  * Paging(分页)
    * Question
      * 如何制造出内存数量无限的幻象
      * Way
        * 分页内存
    * Implementation
      * 在内存操作处拦截
        * MMU
        * Interpreter
        * Process Swap
        * Data Manager
      * 页面替换
      * 工作集大小
      * 分页控制



##Compression(压缩)##
* Implementation
  * 机械冗余
  * 语义冗余
  * 有损压缩
* Ｍethod
  * 表格压缩
    * Simple Coding
    * Huffman coding
    * Other coding
  * 差分编码
    * 根据相临两个数据间的差异来表现序列
      * Delta coding
      * Run-length coding
  * 自省式压缩
    * MTF
    * LZ
    * zlib



##SmallDataStructures小型数据结构##
* PackedData
  * Union
  * Bit Packing
* Sharing
* Copy OnWrite
* EmbeddedPointers
* Mix



##MemoryAllocation##
* Fixed Allocation
  * StaticAlloc
  * PreAlloc
* Variable Allocation
  * DynamicAlloc
  * Heap
* Memory Discard
  * Stack Alloc
* Pooled Alloc
* Compaction
* Reference Counting
* GC



##![http://pic.yupoo.com/qianjigui/CM2ddHDD/medish.jpg](http://pic.yupoo.com/qianjigui/CM2ddHDD/medish.jpg)##
