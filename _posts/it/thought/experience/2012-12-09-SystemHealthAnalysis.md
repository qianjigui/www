---
layout: default
category: it/thought/experience
title: "系统健康与分析"
tags:  system, 优化, 经验
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



##tags: system, 优化, 经验##
