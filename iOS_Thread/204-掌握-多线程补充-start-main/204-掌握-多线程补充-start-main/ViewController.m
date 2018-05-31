//
//  ViewController.m
//  204-掌握-多线程补充-start-main
//
//  Created by 吴佳臻 on 2018/5/31.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Thread.h"
#import "Operation.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.创建线程
    Thread *thread = [[Thread alloc] init];
    //2.启动线程
    [thread start];
    

    
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //2.封装操作
    Operation *operation = [Operation blockOperationWithBlock:^{
       NSLog(@"1---%@",[NSThread currentThread]);
    }];
    //3.添加到队列
    [queue addOperation:operation];
}


@end
