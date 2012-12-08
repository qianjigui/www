---
layout: default
category: it/study/dcu
title: "EE552-BroadbandNetworks"
---

#EE552-BroadbandNetworks#
##history##
*  network
  *  Telephone
    *  end-system端设备
      *  POS
      *  Terminal
      *  PC
      *  Modem
    *  local-loop本地数据交换回路
    *  Transmission facilities 传输设备
      *  媒介
        *  wired
        *  wireless
      *  参数
        *  带宽
        *  FDM
        *  TDM
    *  Multiplexing多波
      *  PCM脉冲编码调制
      *  PDM脉冲宽度调制
    *  Switching数据交换
    *  Signalling信号
      *  控制信号
        *  连接
        *  挂断
      *  识别信号
    *  Billing 计费系统
  *  Data Communication 数字信号通信
    *  CSMA/CD 载波监听多路访问/冲突检测
    *  Frames
    *  优点
      *  抗干扰
      *  抗衰减
    *  数模转换
  *  ATM Asynchronous Transfer Mode
##Asynchronous Transfer Mode##
*  Packet Switching数据包交换
  *  Datagram routing
    *  优缺点
      *  无需连接与断开的准备阶段
      *  选路算法的可适应性强
      *  容易实施部署
      *  数据顺序无法保存
      *  需要构建较大的路由表
      *  报文头部信息需要包含完整的信息
      *  可能存在循环寻路死锁
    *  routing table 路由表
  *  Virtual circuit routing
  *  Contention冲突控制
  *  Buffering缓存
  *  优缺点
    *  数据统计
    *  传输数据可以调节
    *  额外数据
    *  无法提供QoS服务
  *  Features 特征
    *  需求复用 Demand multiplexing
    *  固定长度的数据包 Fixed-length packets
      *  Cell 信源交换
    *  高比特率 High bit rate
    *  面向连接的操作 Connection-oriented operation
  *  设计需求
    *  High-speed operation 高速操作
    *  Rapid decision making 快速处理
    *  Contention resolution 冲突化解
  *  Switch交换方法
    *  Shared-medium 共享介质
    *  Banyan-based 榕树式交换
    *  Crossbar and sort-banyan
    *  Switches based on address filtration
    *  Output-buffered 
    *  Input-buffered 
    *  Internally-buffered 
  *  ATM Adaptation Layer
    *  http://qjg-wiki.googlecode.com/files/BroadbandNetworkATMAAL.jpg
  *  Performance 性能
    *  Analytical 分析法
    *  Numerical 统计法
    *  Simulation 模拟法
