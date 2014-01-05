---
layout: post
lmtime: 2013-08-29
category: it/technical/os/Android
title: "ZygoteStartupSteps"
tags: undefine

---
#ZygoteStartupSteps#



##Linux##
* init
  * restart
  * app_process
    * runtime
      * new
      * config arguments
      * java env
        * startVM 
        * Find Class
        * Find Method
        * invoke Method
          * com.andrid.internal.os.ZygoteInit:main
          * Go to Java World



##Java World##
* ZygoteInit.main
  * RegisterZygoteSocket
  * preload
    * Classes
    * Resources
  * gc
  * startSystemServer
    * com.android.server.SystemServer
    * Zygote.forkSystemServer
      * Child
        * handleSystemServerProcess
          * closeServerSocket
          * Run
            * WrapperInit.execApplication
            * RuntimeInit.zygoteInit
              * applicationInit
                * invokeStaticMain
                  * Get main method
                  * throw new ZygoteInit.MethodAndArgsCaller
      * Parent
        * return true
  * run
    * ForkMode
    * SelectLoopMode
      * add peer to list
      * Get item from list
        * peer.runOnce
          * Prepare
          * forkAndSpecialize
            * Child
              * handleChildProc
                * invokeStaticMain
                * Run
            * Parent
              * peer wait
                * return true
  * closeServerSocket
  * catch MethodAndArgsCaller
    * save to caller
    * caller.run
  * catch RuntimeException
    * save to ex
    * closeServerSocket
    * throw ex
