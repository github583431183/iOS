//
//  ViewController.m
//  303-掌握-Runloop应用
//
//  Created by 吴佳臻 on 2018/6/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSThread *thread;
@end

@implementation ViewController
- (IBAction)createBtnClick:(id)sender {
    //1.创建线程
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(task1) object:nil];
    //2.启动线程
    [self.thread start];
}
- (IBAction)otherBtnClick:(id)sender {
    [self performSelector:@selector(task2) onThread:self.thread withObject:nil waitUntilDone:YES];
}

-(void)task1{
    NSLog(@"task1---%@",[NSThread currentThread]);
    //解决方法:开 runloop
    //1.获取子线程对应的runloop
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    //保证runloop不退出
    //1.1 timer
    //NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    //[runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    //1.2 source
    [runLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    
    //2.默认是没有开启,10s后结束
    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    NSLog(@"---end----");
}

-(void)task2
{
    NSLog(@"task2---%@",[NSThread currentThread]);
}

-(void)run
{
    NSLog(@"%s",__func__);
}

//Runloop中自动释放池的创建和释放
//第一次创建:启动runloop
//最后一次销毁:runloop退出的时候
//其他时候的创建和销毁:当runloop即将睡眠的时候销毁之前的释放池,重新创建一个新的

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
