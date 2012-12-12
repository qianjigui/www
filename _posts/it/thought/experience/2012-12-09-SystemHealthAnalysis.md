---
layout: default
category: it/thought/experience
title: "系统健康与分析"
tags:  system 优化 经验
---

#系统健康与分析#



##内存##
* 明确目标
  * 用对比参照物(同类产品)
  * 量化目标(要优化多少)
  * 经验(可能存在的问题)
* 获取数据
  * 从整体到部分
    * 系统级别total
    * 应用级别PSS,USS
    * 应用内级别smaps
      * Java-Heap
      * Native-Heap
      * Other-Modules
  * Tools
    * SystemAPI
      * proc
      * smaps
    * Jhat
    * MAT
* 定位问题
  * DS-5
  * DependOn Data
* 给出方法
  * PageShared
  * DirtyPage
  * 精简结构



##性能##
* AIM
  * Compare
  * The feature
* Data
  * Profile
* SolveLevel
  * Strategy
    * Algorithm
    * DataStructure
  * Language
    * LanguageFeature
    * Hotpoint
  * Hardware
    * RAM
      * Cached
      * loop 
    * ROM
* Solve



##思想##
* 具体问题具体分析 
* 明确目标
* 数据说话
* 前人经验



##tags: system 优化 经验##



##具体方法##
* 展开循环 
* 消除数据相关性 
* 数据并行处理 
* 优化引用数据结构 
* 减小数据结构的尺寸 
* DRAM板块上的数据分布策略 
* 规划数据流 
* 按字节、双字与四字进行内存处理 
* 数据对齐 
* 内存访问与计算的组合 
* 读写操作的组合 
* 只在必要时才访问内存 
* 内置C内存处理函数的优化 
* 内存处理函数的优化质量 
* C字符串库函数的优化 
* 字符串处理函数的质量优化 
* 块处理算法的优化 
* 大型数组排序的优化  
