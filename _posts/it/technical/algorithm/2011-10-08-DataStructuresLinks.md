---
layout: post
lmtime: 2013-05-04
category: it/technical/algorithm
title: "数据结构"
tags:  DataStructure Review

---
#数据结构#



##图##
* 搜索
  * 广度
  * 深度
* 拓扑排序
* 最小生成树
* 最短路径



##树形结构##
* 二叉树
  * 遍历
    * 前序
    * 中序
      * 和另外一个序一起还原二叉树
        * 排序二叉树思维加权
      * 转换成双向链表
    * 后序
    * 层次
    * 结果序列配合排序二叉树判断合法性
      * 利用根节点对序列进行切割
  * 霍夫曼
  * 共同祖先
    * 离线
    * 在线
    * 含有父亲节点
      * 链表相交问题
    * 遍历查询
  * 线索
  * 排序二叉树
    * 平衡二叉树 
* m叉树
  * B树
  * B+树



##线性结构##
* 数组
  * 循环左移
    * (A^B^)^=BA
    * 二分查找
      * 分类讨论
      * 注意边界值
  * 排序
    * 插入
      * 升序O(n)
      * 降序O(n^2)
    * 冒泡
      * 升序O(n^2)
        * 加标记改进
          * O(n)
      * 降序O(n^2)
    * 选择
      * 升序O(n^2)
      * 降序O(n^2)
    * 希尔
      * O(n^1.25)
    * 快速
      * Partition思维
        * 两边夹交换处理
        * 双前进推进处理
          * 最长数字
    * 归并
    * 堆排序
      * 结构
    * 线性时间
      * 基数
      * 桶排
  * 可伸缩数组
    * 平摊分析
      * Java
        * Vector
          * 线程安全
          * 翻倍增长
          * Stack
        * ArrayList 
          * 150%增长
          * Object[]
        * Hash
          * Map
            * 允许null，即null value和null key
            * WeakHashMap
              * 如果一个key不再被外部所引用，那么该key可以被GC回收
          * Table
            * 线程安全
            * 任何非空（non-null）的对象都可作为key或者value
            * default-size=101
            * icrease-factor=0.75
          * 按照散列函数的定义，如果两个对象相 同，即obj1.equals(obj2)=true，则它们的hashCode必须相同，但如果两个对象不同，则它们的hashCode不一定不同，如 果两个不同对象的hashCode相同，这种现象称为冲突，冲突会导致操作哈希表的时间开销增大，所以尽量定义好的hashCode()方法，能加快哈希 表的操作
        * Set
          * 任意的两个元素e1和e2都有e1.equals(e2)=false
          * HashSet
            * HashSet 是一个由 HashMap 组装出的类,自己的值做key , static final Object PRESENT做value
* 链表
  * Java
    * LinkedList
      * 无同步方法
        * List list = Collections.synchronizedList(new LinkedList(...));
  * 找环
  * 找交叉
  * 双开:一起跑
    * 倒数第K个
    * x/y
  * 排序
    * 冒泡
      * 向后冒泡:最大值
    * 有序链表合并
  * 时间插入、删除
    * 替代O(1)
    * 遍历O(n)
* 栈
  * O(1):Min,Max
* 队列
* BitMap
* 串
  * 所有处理与数组一样
  * 后缀数组
    * 最长重复字符串
    * 后缀化处理
    * 排序
    * 相邻比较
  * Trie树
    * http://apps.hi.baidu.com/share/detail/15692486
  * ASCII
    * A在a前面并且不连续
    * 脚标数组
  * 模式匹配
    * 有限自动机
    * KMP
      * next



##算法##
* 动态规划
  * 最长公共子序列
  * 最长上升子序列
  * 等等，总结基本模式
    * 分治
    * 公共子结构
    * 递推计算
    * 回溯结果
* 贪心
* Search
  * 二分
  * 索引
  * Hash
* 并查集



##tags: DataStructure Review##
