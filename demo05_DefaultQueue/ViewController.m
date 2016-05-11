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
    
}

/** 主队列异步 */
- (IBAction)mainQueueAync:(id)sender {
    
}

/** 主队列同步 */
- (IBAction)mainQueueSync:(id)sender {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
