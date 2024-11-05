---
layout: lecture
date: 2023-03-02
title: Performance
description: Profilers y performance
ready: true
---


## `perf`

### Métricas de performance.
Las métricas se construyen en base a `events`:
```shell
ls /sys/bus/event_source/devices/cpu/events/
```

tambien podemos ver las métricas que usa `perf` con:
```shell
perf list --details
```                                         	


```
 Performance counter stats for './austal short':

          7.155,69 msec task-clock                       #    1,000 CPUs utilized             
               118      context-switches                 #   16,490 /sec                      
                 3      cpu-migrations                   #    0,419 /sec                      
             7.414      page-faults                      #    1,036 K/sec                     
    29.695.155.163      cycles                           #    4,150 GHz                       
    47.379.828.377      instructions                     #    1,60  insn per cycle            
     6.172.097.825      branches                         #  862,545 M/sec                     
        43.727.245      branch-misses                    #    0,71% of all branches           

       7,157403331 seconds time elapsed

       7,090932000 seconds user
       0,064990000 seconds sys
```

+ **task-clock**        : meassures how "parallel" the job has been (how many cpus were used).    
+ **context-switches**  : how the scheduler treated the application. How interrupted has been. Lower is better.
+ **cpu-migrations**    : how much the shceduler moved the application between cores. Lower is better.
+ **page-faults**       : the number of times the program tried to access memory that wasn’t in physical RAM, requiring the system to fetch it. Higher page faults can slow down performance.    
+ **cycles**            : number of CPU cycles spent in executing the program.    
+ **instructions**      : number of instructions executed. The number of instructions per cycle is a good indicator of how efficient the program is.
+ **branches**          : tell you how many jumps and loops are performed in your code. Correctly predicted branches should not hurt your performance, 
+ **branch-misses**     : branch-misses on the other hand hurt your performance very badly and lead to stall cycles.    



## `gprof`
