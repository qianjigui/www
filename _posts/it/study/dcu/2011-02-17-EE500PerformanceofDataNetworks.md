---
layout: default
category: it/study/dcu
title: "EE500PerformanceofDataNetworks"
---

#EE500PerformanceofDataNetworks#
##background##
*  Hierarchy of Layer
  *  Modularity模块化
  *  Protocol协议化
  *  Interfaces接口化
*  Example
  *  OSI
  *  TCP/IP
*  Five Layer factors
  *  Physical
    *  signal
      *  bandwidth
        *  Signal
        *  Channel
      *  Problems
        *  noise
          *  crosstalk串线
          *  impulse noise叠加
          *  thermal or white noise物理设备热辐射
        *  signal attenuation信号辐射
        *  signal distortion信号失真
        *  delay distortion延迟失真
      *  Capacity 有效载荷
        *  香农定律
    *  Converting bits into signals
      *  Way
        *  DC/lowpass矩形波
          *  Encoding Schemes
            *  NRZ(Non-Return-Zero)
            *  Bipolar
            *  Manchester
          *  http://qjg-wiki.googlecode.com/files/DCLowpass.jpg
        *  Bandpass/Modulated叠加正弦波(Ignore Low Frequence)
          *  Modulation techniques
            *  ASK
            *  FSK
            *  PSK
            *  DPSK
    *  Switching and multiplexing
      *  Switch
        *  Circuit
        *  Packet
          *  Virtual Circuit
          *  Datagram
      *  Multiplexing
        *  FDM
        *  TDM
        *  Statistical
          *  Framing
  *  Data Link
    *  Framing
    *  Detecting and correcting errors
      *  FEC
        *  CRC
      *  BEC
    *  Controlling data flow
      *  Stop and wait
        *  ARQ
      *  Sliding window
        *  ARQ
  *  Network
    *  Routing
  *  Transport
    *  TCP
    *  UDP
  *  Application
##QoS##
*  the collective effect of service performance which determine the degree of satisfaction of a user of the service
*  SLA(Service Level Agreement)服务级别许可
  *  Service Level Objectives (SLO)要求
    *  Parameters
      *  Availability可靠性
        *  the percentage of the feasibility of service in every particular service request 成功服务率
        *  availability of service is the key parameter that customers are interested in
      *  Delivery 传输稳定性
        *  the converse of packet loss, which means that a percentage of each service is delivered without packet loss 成功传输率
        *  packet delay 数据包延迟 
      *  Latency 延迟
        *  the time taken for a packet to travel from a service access point (SAP) to a distant target and back
        *  it usually includes the transport time and queuing delay. 
      *  Bandwidth 带宽
        *  means the used capacity or available capacity – stated in the SLA 
      *  MTBF (Mean Time Between Failure) 
      *  MTRS (Mean Time to Restore Service) 
        *  The average time that a device will take to recover from any failure 
  *  Service Level Guarantees (SLG)保证
    *  QoS Viewpoint
      *  http://qjg-wiki.googlecode.com/files/FourViewpointOfQoS.jpg
  *  Service Level Management (SLM) 管理
    *  http://qjg-wiki.googlecode.com/files/QoSSLMImg.jpg
*  传输层
  *  TCP
    *  可靠分组连接服务
      *  分组大小
        *  MSS(Maximum Segment Size)
          *  Segment Header
            *  TCP Header(20bytes)
            *  IP Header(20bytes)
          *  越大效率越高，主要问题是每一段都需要附带一个包头。段越多，包头越多。整体上效率越低。
          *  连接时确定
          *  由SYN Segment携带
          *  Default Value=534bytes
    *  失效重发
      *  重发的时间控制
        *  RTO(Retransmission TimeOut)
          *  由RTT(Round trip time)确定初值
          *  由SRTT(Smoothed estimator)估计
            *  low-pass filter
          *  2次指数增长
            *  1,3,7,15,31,63
        *  Keepalive Timer
          *  如果在一个时间段内全部为失败，则需要重置连接
        *  http://wwuyingjie.blog.51cto.com/309671/109553
    *  拥塞控制
      *  慢启动
        *  确定传输时候的参数(网络承载能力)
          *  Congestion window (cwnd) 
          *  Receiver window (rwnd)  
          *  Slow start threshold (ssthresh) 
          *  Sender Maximum Segment Size (SMSS) 
          *  FlightSize 
      *  冲突处理
        *  发生
          *  发送端超时
          *  数据包冲突
      *  快速重传
      *  快速恢复
    *  具体实现
      *  http://jasonccie.blog.51cto.com/2143955/422966
      *  Tahoe(原始)
        *  无快速恢复
        *  无快速重传
      *  Reno
        *  添加了快速恢复
        *  对丢包进行分类
          *  超时
          *  ACK
      *  New Reno
        *  调整重传机制
      *  SACK
        *  调整块大小
      *  Vegas
    *  SCTP
      *  用途
        *  无线
        *  手机
      *  Need
        *  Multi-Streaming
        *  Multi-Homing
      *  Features
        *  Reliable transport protocol
          *  可靠
        *  Use association instread of connection
          *  关联
        *  Design for message oriented application
          *  面向消息应用的设计
          *  块绑定
        *  Acknowledge error free transfer of message
        *  Detection of data corruption, data loss and data duplication
        *  Selective retransmission to correct lost data and duplicated data
          *  选择性ACK
        *  Active monitoring of session connectivity via heartbeat 
        *  Resistance to denial of service attacks 
          *  抵抗DDOS
        *  Supports multi-streaming 
        *  Supports multi-homing 
      *  http://blogold.chinaunix.net/u1/34831/showart_1871853.html
      *  Message Format
        *  http://qjg-wiki.googlecode.com/files/SCTP-Header.jpg
        *  http://qjg-wiki.googlecode.com/files/SCTP-Chunks.jpg
        *  http://qjg-wiki.googlecode.com/files/SCTP-Chunk-Important.jpg
      *  Association Establishment Procedure 
        *  http://qjg-wiki.googlecode.com/files/SCTP-Connection-Steps.jpg
        *  :

Steps:
1. Assume Endpoint A initiates association establishment with endpoint B
1. A sends an INIT chunk and enters the COOKIE WAIT state
1. A starts an INIT timer whose timeout determines resending of the INIT chunk
1. B receives the INIT chunk and reads chunk data
1. Based on the data, B generates a secure hash code using a secret key
1. The generated values are placed into a COOKIE chunk, along with the derived message authentication code (MAC)
1. The cookie is sent to A in an INIT-ACK chunk
1. B remains in CLOSED state
1. A receives the INIT-ACK chunk and stops the INIT timer
1. A places the cookie from the INIT-ACK chunk in a COOKIE ECHO chunk returned to B
1. A COOKIE ECHO timer is started whose timeout determines resending of COOKIE ECHO
1. A enters the COOKIE ECHOED STATE
1. B receives the echoed cookie and uses MAC to verify it If OK, B initialises the SCTP instance
1. B responds with a COOKIE-ACK chunk
1. Both A and B endpoints enter the ESTABLISHED state




      *  Mobile SCTP
        *  Adds Dynamic Address Reconfiguration (ADDIP) 
          *  Enables SCTP to add, delete, and change existing IP addresses attached to an association during an active connection
          *  Enables support for seamless handover for mobile hosts that are moving between IP networks 
        *  Uses ASCONF and ASCONF-ACK chunks 
          *  Add new IP address to the association 
          *  Change the primary IP address of the association 
          *  Delete an old IP address from the association 
  *  UDP
    *  DCCP
      *  Features
        *  Supports unreliable transport of datagram flows 
        *  Provides acknowledgements 
        *  A reliable handshake for connection setup and teardown 
        *  Reliable negotiation of features 
        *  A choice of TCP-friendly congestion control mechanisms
          *  TCP-like congestion control [RFC 2581] (CCID 2)
            *  appropriate for flows wishing to quickly take advantage of available bandwidth
          *  TCP-Friendly Rate Control [RFC 3448] (CCID 3)
            *  appropriate for flows that require a steadier sent rate
        *  Options to tell reliably the sender which packets reached the receiver 
          *  and if lost packets were ECN marked, corrupted, or dropped in the receive buffer 
        *  Congestion control including Explicit Congestion Notification (ECN) and ECN Nonce 
        *  Mechanisms to avoid holding state for unacknowledged connection attempts or finished connections 
        *  No graceful close, no other flow control apart from congestion control 
##Network Performance Metrics##
*  Availablity
  *  Connectivity
  *  Functionality
*  Loss
  *  One Way Loss
  *  RT(Round Trip) Loss
*  Delay
  *  One Way Delay
  *  RT Delay
  *  Delay Variance
*  Utilization
  *  Capacity
  *  Bandwidth
  *  Throughput
*  http://qjg-wiki.googlecode.com/files/QoSParametertoNPMMapping.jpg
*  Measurement method
  *  Active
    *  Mechanism
      *  Generate test traffic periodicaly or on-demand 
      *  Measure performance of test packet response 
    *  Method
      *  ICMP
        *  Find problem
        *  RT Loss
        *  RT Delay
      *  TCP
        *  Bandwidth
        *  Rate
      *  UDP
        *  One way loss
        *  RT bandwidth
    *  Factors
      *  Multi-point
      *  Small data size
      *  Additional traffic
      *  For Delay, packet loss,  availability
      *  Low to Moderate CPU
  *  Passive
    *  Mechanism
      *  Capture the traffic by mirroring or splitting 
      *  Analyze the captured packets 
    *  Method
      *  SNMP
    *  Factors
      *  Single or multi point
      *  Large data size
      *  Device overload/no overlod with splitter
      *  For Throughput, traffic pattern, trend and detection
      *  High CPU usage
*  测量方法的缺点
  *  Active Measurements - problems 主动测量的问题 
    *  Path Asymmetry 路径不一致，发送与接收路径就有可能有不同
      *  Nodes visited by traceroute are those in 'forward' path, which are not necessary the same as 'reverse' path
    *  Unstable Paths and False Edges 发送的路径不稳定，有些节点可能已经失效
      *  Traceroute reports nodes visited by successive probe packets with increasing TTL. Discovered IP path is only valid if the path being measured does not change during measurement process.
    *  Alias Resolution 同一个设备可能有多个标示
      *  Traceroute discovers 'interfaces' rather than 'routers' 不仅仅是路由，还有很多是接口
      *  Nodes can have multiple network interfaces, each with different IP address 同一个节点可能含有多个网卡
      *  Source IP address in ICMP 'time exceeded' response packets is the address of the interface that the router uses to send packets back.
      *  If both interfaces belong to the same router, responses will be sent by one interface => we can match ECHO responses from trace route to both IP address. If the response comes from the same source interface, we infer that both interfaces belong to the same router
    *  Measurement load 用于测量的负载
      *  Sometimes RTT for TTL=n could be smaller than TTL=n‐1
  *  Passive Measurements - challenges 被动测量的挑战 
    *  Large volume of measurement data 大量需要测量的数据
      *  Challenges in storing and processing data 存储与处理数据
    *  Privacy issues 隐私问题
    *  Collection of detailed traffic statistics from heterogeneous network links. 异构网络详细统计间有冲突
    *  Non‐interference with the measured network (nonintrusiveness). 存在很多不允许干扰的网络
    *  Obtaining a global view of the monitored network from a reasonable number of monitoring points. 如何由一部分来考察整体
*  Performance
  *  Packet loss rate
  *  Latency
  *  Jitter
  *  Throughput
  *  Available bandwidth; bottleneck bandwidth
##Modeling and Simulations##
*  Modeling
  *  Motivation
    *  Understanding and predicting complex system behaviours
      *  Ignore
        *  environment
        *  Input
        *  Output
    *  Building real time system
      *  Expensive
      *  Require personnel
      *  Difficult to modify
      *  Not sure how
  *  Benefit
    *  Allows for investigation of the properties of the system 
    *  Enables prediction of future system behavior and outputs 
  *  As a solution
    *  Reduced complex
    *  Important characteristics only
    *  Cheaper
    *  Highly modifiable
  *  Limitation
    *  Accuracy
      *  Parameters
      *  Initial Conditions
      *  Environment influence
    *  Most models are inherently inexact (due to the simplifications and assumptions made) 
  *  Definition
    *  Process of building a model 
    *  Designing and analyzing a representation of a system to study the effect changes to system variables have 
      *  Simulation
      *  Analysis
  *  Type
    *  Variables
      *  Deterministic: all variables are deterministic 
      *  Stochastic: some model variables or behavior are random 
    *  Model
      *  Static: the model does not change in time 
      *  Dynamic: the model is modified in time 
    *  Time
      *  Continuous: the system state evolve continuously
      *  Discrete: the system state changes at discrete points in time
  *  Stages
    *  A
      *  Simplification and abstractisation 
        *  A model contains essential characteristics of real-life objects or events 
        *  This stage identifies relevant features of the real system to be modeled 
        *  Assumptions are made 
        *  Input parameters are determined 
        *  Output measures are listed 
      *  Representation and Measurements 
        *  Objects, events, numbers and relationships in the real system are associated model components 
      *  Manipulation 
        *  Implications of real world objects and relationships are determined
        *   New objects and relationships are represented 
      *  Verification 
        *   Outcomes from the model are compared with real word outcome 
        *   It is determined if the model is adequate for the desired purpose 
    *  B
      *  Determine goals and objectives 
        *  Level of abstractisation 
        *  Relevant features to be modelled 
        *  Required input and expected output 
      *  Build a conceptual model 
        *  Very high level 
        *  Determines how comprehensive the model will be 
        *  Determines state variables; if they are dynamic, how important they are, etc. 
      *  Create the specification model 
        *  Average detailed level 
        *  May involve equations, pseudocode, etc. 
        *  Indicates input and output 
      *  Convert into a computational model 
        *  Low detail level 
        *  Involves a general purpose or a simulation programming language 
        *  It is the actual useful model 
      *  Verification and validation 
        *  (Verification)Did we build the model right? (according to specifications) 确认
        *  (Validation )Did we build the right model? (relative to the real system) 证实
##Android##
*  Architecture
  *  http://qjg-wiki.googlecode.com/files/Android-system-architecture.jpg
  *  Android Runtime Layer
    *  Core Libraries – provide the functionality of JAVA Programming Language 
    *  Android Applications runs in its own process, with its own instance of the Dalvik Virtual machine 
    *  Dalvik VM: Java based license free VM 
      *  Register based VM, optimization for low memory requirements 
      *  Executes files in the Dalvik Executable (.dex) format 
      *  DX tool converts classes to .dex format 
      *  Relies on the Linux Kernel for underlying functionality: threading and low-level memory management 
##Performance at Higher Network Layers ##
*  QOE
  *  Definition
    *  Subjective measure of a user’s experience with a service 
  *  Areas
    *  Service
    *  User
    *  Device
    *  Network
    *  Cost
    *  Content and Context
*  Improving 
  *  Transport Layer Solutions 
    *  RTP/RTCP
      *  Provide
        *  End-to-end delivery mechanism for real-time multimedia traffic 
        *  Sequence numbering and time-stamping of packets in the stream 
        *  Payload type identification 
        *  Supports multicast distribution 
        *  Monitoring of Quality of Service (QoS) of delivery 
        *  Identification of different sources of traffic within an application session 
      *  http://zhangjunhd.blog.51cto.com/113473/25481
  *  Application Layer Solutions 
    *  RTSP
    *  QOAS
    *  RAP
    *  LQA
##Performance at Lower Network Layers ##
*  Internet
  *  Router
    *  Algorithm
      *  Distance Vector
      *  Link State
  *  Protocol
    *  IPv4
    *  IPv6
*  Physical
  *  Wireless
    *  PANs
      *  Bluetooth
    *  LANs
      *  WiFi
    *  MANs
      *  WiMAX
##Mobility Issues##
*  Moblie IP
  *  Features
    *  Enables dynamical point of network attachment change with host location change 
    *  Maintains all network connections 
    *  Enables hosts to be tracked without changing their IP addresses 
    *  Requires no software changes in any non-mobile hosts or routers 
    *  Requires additional infrastructure 
    *  Requires no modifications to IP addresses or IP address format 
    *  Supports security 
    *  Standardised by the Internet Engineering Task Force (IETF) 
  *  Nodes     移动节点（MN）、家乡代理（HA）、通信节点（CN）。其中MN为移动终端；HA位于家乡子网，负责记录MN的当前位置，并将发往MN的数据转发至MN的当前位置；CN为与MN通信的对端节点。 
    *  Mobile Node (MN) 
      *  A host that changes its point of attachment from one network or subnetwork to another 
      *  Assigned a permanent IP address (called home address) which does not change 
      *  All other hosts send packets to the home address regardless of mobile node’ s location 
      *  It continues to communicate with other hosts via the network at current location 
    *  Home Agent (HA) 
      *  A router with additional functionality 
      *  Located on the home network of MN 
      *  Maintains current location information of MN 
      *  Performs mobility binding of MN’ s home address with temporary IP address dependent on current location 
      *  Forwards packets (tunnels) to the appropriate network when MN is away 
    *  Foreign Agent (FA) 
      *  A router on a MN's visited network with enhanced functionality 
      *  Advertises itself periodically 
      *  Accepts MN registration requests 
      *  Sends a care-of-address (CoA) (usually FA’ s IP address) to HA when a MN registers 
      *  Provides routing services to the MN while registered 
        *  The foreign agent detunnels and delivers datagrams tunneled by HA to the MN
        *  Routes all datagrams sent by MN
    *  Correspondent Node (CN)
      *  End-host with which MN communicates (e.g. a web server, another host) 
      *  Can be located anywhere 
      *  Can be mobile or stationary 
      *  Is not aware of the fact that MN is changing location 
*  Hierarchical Mobile IPv6 (HMIPv6) 
  *  Principles 
    *  Frequent handovers increase the BU overhead 
    *  Increased delay if CN is located far away from the MN 
    *  Hierarchical Mobile IPv6 organizes the network hierarchically 
    *  Separate mobility management in local mobility and global mobility 
    *  Mobility anchor point (MAP) manages local mobility 
  *  Handover Procedure 
    *  MN (at home) communicates with CN 
    *  MN moves to new network (Stage 1) 
    *  MN registers its CoA with HA (Stage 2) 
    *  MN registers its CoA with MAP (Stage 3) 
    *  MN moves to new network in same domain(Stage 4) 
    *  MN registers its CoA with MAP (Stage 5) 
    *  MN moves to new network in a different domain (Stage 6) 
    *  MN registers its CoA with HA (Stage 7) 
    *  MN registers its CoA with MAP (Stage 8) 
*  Intra-MSC
  *  Handover
    *  http://qjg-wiki.googlecode.com/files/Intra-MSC-Handover.jpg
    *  Aim
      *  Perform communication with mobile device via BSS B instead of via BSS A 
      *  Seamless continue the communication 
    *  Initiation
      *  handover initiated by BSS A 
      *  stronger signal to/from BSS B than that to/from BSS A 
      *  maintaining connectivity 
      *  reducing battery power drain 
      *  Balancing load (free resources e.g. channel in BSS A) 
    *  Process
      *  BSS A informs MSC about pending handover and provides a list of potential BSSs 
      *  MSC selects BSS B from list and sets up path to BSS B 
      *  BSS B allocates radio channel to be used by MS 
      *  BSS B informs BSS A via MSC it is ready for handover 
      *  BSS A informs MS to perform handover to BSS B 
      *  MS and BSS B exchange signals to activate new channel 
      *  MS informs MSC via BSS B about handover completion. MSC reroutes call 
      *  MSC and BSS A release resources 
*  http://hi.baidu.com/yuanmx0307/blog/item/a10b79ec474da54779f05540.html
##Energy Conservation in Wireless and Mobile Communications ##
*  OSI layer - power save protocols 
  *  Load Partitioning 
    *  all the power intensive computation is performed at the AP and not locally. The Mobile device sends a request to the AP which contains the computation that needs to be performed and waits for the result. 
  *  Application – based Adaptive Mechanisms 
    *  Proxies – used to inform the application about the changes in battery power. The applications can use this info in order to limit their functionalities 
    *  For database systems – energy can be conserved by reducing the number of transmissions for different operations: data retrieval, indexing, querying operations. 
    *  For video processing – adaptation mechanisms which slightly degrade the video quality by reducing the number of bits transmitted over the wireless system 
  *  Transport Layer 
    *  TCP-Probing 
    *  Wave and Wait Protocols 
  *  Network Layer 
    *  Routing Protocols 
      *  Backbone based routing protocol 
        *  backbone node骨干节点
          *  Active
          *  A path between all source and destination nodes in the network is established 
          *  Any node will be within one hop of at least one backbone node 
          *  The decision of which nodes to be the backbone nodes is also changing periodically 
        *  Other nodes
          *  Sleep periodically
      *  Topology based routing protocol 
        *  Goal: reduce the transmission power of all nodes in the network 
        *  All the nodes operate with the lowest transmission power possible 
        *  Homogeneous networks – the nodes are within the range of their nearest one-hop neighbour 
        *  Heterogeneous networks – (different nodes with different power limitations) – transmission powers may be adjusted according to the network needs 
  *  Data Link Layer 
    *  The techniques involve reducing the transmission overhead during ARQ (Automatic Repeat Request) and FEC (Forward Error Correction) - schemes used to reduce the number of packet errors at the receiver 
    *  ARQ enabled – the router can automatically request the retransmission of a packet directly from its source without involving the receiver. 
    *  It has been shown that transmitting at lower power and sending multiple ARQ is more energy efficient than to send at high transmission power and achieve better throughput. 
    *  By integrating FEC – which reduces the number of retransmissions necessary at the lower transmission power – more energy savings can be achieved 
    *  Packet Scheduling protocols - may reduce the number of retransmissions => the overall power consumption is reduced 
  *  MAC Layer 
    *  Sleep Scheduling Protocols 
      *  Basic Principle: a big amount of power is wasted listening on the radio channel even though there is nothing there to receive 
      *  The radio will switch between its on and off power states in order to reduce the effects of the idle listening 
      *  The radio interface will be wake up whenever it expects to transmit or receive packets and sleep otherwise 
    *  Synchronous Sleep Scheduling Protocols 
    *  Battery aware MAC protocols (BAMAC) 
  *  Physical Layer 
  *  Topology Control Mechanisms 
*  Existing Standards
  *  WPAN - 802.15.1 standard (Bluetooth) 
    *  There are 8 different operational states defined in Bluetooth, 3 of them are dedicated to low power operations 
      *  Sniff state - the active Bluetooth device lowers its duty cycle and listens to the piconet at reduced rate 
      *  Hold state - the device shuts down all communication capabilities it has with the piconet, but keeps the slot (from the seven activeslots available in a piconet) as active 
      *  Park state - disable all communication with the piconet, as in case of Hold state, except that this time give up also its access to one of the seven active slots available for the devices within the piconet 
  *  WiMAX
    *  3 Power Save Classes (PSCs) based on different QoS characteristics 
      *  Each PSC consists of a sequence of interleaved listening and sleep intervals 都含有相间的监听和等待
      *  Can support one or multiple traffic flows in a mobile station with similar characteristics 支持一个或多个数据流
      *  A mobile station can turn off its radio interface when all its PSCs are in the sleep window, it wakes up when any PSC is in a listening window 在空闲时可以完全进入睡眠状态，如果有某个PSC进入监听状态，则唤醒其他。
      *  Each flow of a mobile station can be corresponded to a PSC 每个流都可以响应PSC
      *  class power saving 
        *  1st
          *  designed for non-real-time traffic flows 
          *  it has exponentially increasing sleep window if no packet comes 
        *  2nd
          *  designed for real-time traffic flows 
          *  It has a fixed size of sleep window 
        *  3rd
          *  designed for multicast connections or management opeartions 
      *  http://qjg-wiki.googlecode.com/files/WiMAXClassesPowerSaving.jpg
  *  LTE
    *  RRC Active State 
      *  Data is exchanged between the network and the mobile device 数据交换发生在网络和移动设备中
      *  The mobile remains in active state even when there is no data transmitted for some time (e.g., after the content of a web page has been fully loaded) 一直处于工作状态不管是否有数据传输
      *  The mobile can deactivate its receiver in order to conserve energy 移动设备可以关闭接收端以降低能耗
      *  After some inactivity time the network can activate the Discontinuous Reception Mode (DRX) - meaning that the mobile has to listen to downlink bandwidth assignments and control commands periodically and switch off its receiver at all other times 
      *  DRX interval can be flexible (from ms to s) 
      *  Mobility is controlled by the network - the mobile device has to send signal measurements from the current or neighbour cell
    *  RRC Idle State 
      *  If no packets were transmitted for a certain amount of time, the eNodeB can put the connection to a user in RRC Idle state 如果没有传输，则进入关闭状态
      *  The logical connection to the network and the assigned IP address is retained 地址被保留
      *  The radio connection is removed 信号连接关闭
      *  The MME is informed about the Idle State as the IP packets arriving from the Internet cannot be delivered to the radio network 
      *  In this case the MME sends a paging message to the mobile device, re-establishing the radio bearer 
      *  If the mobile device in Idle states wants to send an IP packet, it has to request the establishment of a new radio bearer before the packet transmission 
      *  When in Idle state, the network cannot control the mobility of the device 
      *  The device can decide on its own to move from one cell to another 
      *  The device has to report a cell change to the network only if the tracking area is changed (a tracking area consists of several cells) 
      *  MME will send a paging message via all the cells within the tracking are when a new IP packet for the device arrives from the Internet 
*  Energy Harvesting Techniques 
  *  Solar panels 
  *  Piezoelectric materials 
  *  Human Active Energy 
  *  Human Passive Energy 
  *  RF Energy/Ambient Energy 
  *  Wind Generators 
##http://code.google.com/p/wpcdcuassignment2010-2011/downloads/detail?name=500ee.zip&can=2&q=##
