//
//  ViewController.m
//  210-掌握-NSRunLoop相关类
//
//  Created by 吴佳臻 on 2018/6/4.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self timer1];
    //[self timer2];
    
    //子线程调用timer2,timer 不运行，因为没有runLoop,并开启runLoop
   // [NSThread detachNewThreadSelector:@selector(timer2) toTarget:self withObject:nil];
    
}

-(void)timer1{
    //1.创建定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    //2.添加定时器到runLoop中，指定runLoop的运行模式为NSDefaultRunLoopMode
    /*
     第一个参数:定时器
     第二个参数:runloop的运行模式
     */
    //非界面事件响应
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //UITrackingRunLoopMode:界面追踪
    //界面事件时响应
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
    //NSRunLoopCommonModes = NSDefaultRunLoopMode + UITrackingRunLoopMode
    
     //占用,标签,凡是添加到NSRunLoopCommonModes中的事件都会被同时添加到打上commmon标签的运行模式上
    /*
     0 : <CFString 0x10af41270 [0x10a0457b0]>{contents = "UITrackingRunLoopMode"}
     2 : <CFString 0x10a065b60 [0x10a0457b0]>{contents = "kCFRunLoopDefaultMode"
     */
    //    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)timer2
{
    NSRunLoop *currentRunloop = [NSRunLoop currentRunLoop];
    
    //该方法内部自动添加到runloop中,并且设置运行模式为默认
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    //开启runloop
    [currentRunloop run];
}

-(void)run
{
    NSLog(@"run-----%@---%@",[NSThread currentThread],[NSRunLoop currentRunLoop].currentMode);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
