---
layout: default
category: it/technical/design
title: "TheArtOfConcurrency"
tags:  Concurrency Rules Threads

---
#TheArtOfConcurrency#



##背景##
* 基本概念
  * 并发
    * 相同的工作同时运行
  * 并行
    * 不同类的工作一齐运行
* 主要问题
  * 任务划分与分配
    * 负载均衡
    * 分发与合并的开销与损耗
  * 数据共享
    * 并发与独占
    * 读与写
    * Tools
      * 锁(资源共享)
      * 信号量(线程同步)
* Steps
  * Analysis:Find the concurrency
  * Design&Implement:Thread model & algorithm
  * Test
  * Performance
    * Egs
      * False Sharing
      * Bus Overload
* Model
  * PRAM(Parallel Random Access Machine)



##Todo##
* DesignModel
  * Task Decomposition
    * Granularity粒度
      * Coarse粗
      * Fine细
    * Dependency依赖
      * Order
      * Data
    * Scheduling调度
      * Dynamic
      * Static
  * Data Decomposition
    * Cell
* Steps
  * Performance
  * 简单
  * 可移植
  * 可伸缩
* Can't
  * Algorithm With status
  * 递推
  * 归纳Induction Variable
  * 归约Reduction
  * Loop-Carried-Dependence



##MultiThreadsDesignRules##
* 找出真正独立的运算
* 在尽可能高的层次上实现并发
* 尽早考虑通过增加处理器核的数量来获得可伸缩性
* 尽可能使用线程安全的库
  * MTK
  * IPP
* 使用正确的线程模型
  * Library
  * Framework
    * OpenMP
    * Interl Threading Building block
* 永远不要假设程序会按照某种特定的顺序运行
* 尽可能使用线程局部存储或与特定数据相关的锁
* BraveToRefactorCodeToGetPerformance



##ThreadingFrameworks##
* OpenMP
* Interl Threading Building Blocks
* Erlang
* OpenMPI
* PThreads



##Tools##
* Debug
  * dbg
  * dbx
  * VTune(Checker)
* Performance
  * gprof
  * VTune



##tags: Concurrency Rules Threads##
