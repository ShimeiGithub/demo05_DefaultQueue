//
//  ViewController.m
//  demo05_DefaultQueue
//
//  Created by LuoShimei on 16/5/11.
//  Copyright © 2016年 罗仕镁. All rights reserved.
//
/**  
    GCD共有三种队列形式：
    1.用户对列：用户队列就是用户使用dispatch_queue_create()方法创建的队列，用户可以自定义队列是串行还是并行
    2.全局队列：global_queue，全局队列有系统自动创建，通常是我们将需要执行的任务放到全局队列中去执行，全局队列是并行队列。
    3.主队列：主队列可以理解为主线程，主队列 放在主线程中执行的，主队列是串行的。
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/** 全局队列异步 */
- (IBAction)globalQueueAsync:(id)sender {
    //获取系统创建的主队列，主队列的生命周期跟进程的一致
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(globalQueue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"全局队列异步：i = %d,current thread:%@",i,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    
    dispatch_async(globalQueue, ^{
        for (int j = 0; j < 10; j++) {
            NSLog(@"全局队列异步：j = %d,current thread:%@",j,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    
    
}

/** 主队列异步 */
- (IBAction)mainQueueAync:(id)sender {
    //获取主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(mainQueue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"主队列异步：i = %d,current thread:%@",i,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    
    dispatch_async(mainQueue, ^{
        for (int j = 0; j < 10; j++) {
            NSLog(@"主队列异步：j = %d,current thread:%@",j,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
}

/** 主队列同步(会造成死锁，不会使用的) */
//dispatch_sync此方法 要求主队列立即执行block中语句
//主线程 你要排队,因为主线程是串行的，必须等你之前的任务做完 才能帮你
//同步 要求线程立刻开始做， 异步 有时间就执行
- (IBAction)mainQueueSync:(id)sender {
    //获取主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_sync(mainQueue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"主队列异步：i = %d,current thread:%@",i,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
