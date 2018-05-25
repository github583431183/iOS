//
//  ViewController.m
//  110-掌握-NSOperation操作依赖和监听
//
//  Created by 吴佳臻 on 2018/5/25.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    NSOperationQueue *queue2 = [[NSOperationQueue alloc]init];
    
    //2.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4---%@",[NSThread currentThread]);
    }];
    
    //3.操作监听
    op3.completionBlock = ^{
        NSLog(@"op3.completionBlock------%@",[NSThread currentThread]);
    };
    
    //添加操作依赖
    //注意点:不能循环依赖
    //可以跨队列依赖
    [op1 addDependency:op4];
    // [op4 addDependency:op1];
    
    [op2 addDependency:op3];
    
    //添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue2 addOperation:op4];
    
    /*
      3---<NSThread: 0x604000270b40>{number = 8, name = (null)}
      4---<NSThread: 0x60400026e7c0>{number = 10, name = (null)}
      2---<NSThread: 0x6000004614c0>{number = 11, name = (null)}
      1---<NSThread: 0x60400026e7c0>{number = 10, name = (null)}
      op3.completionBlock------<NSThread: 0x60800026c300>{number = 12, name = (null)}

     4->1
     3->2
     */
}


@end
