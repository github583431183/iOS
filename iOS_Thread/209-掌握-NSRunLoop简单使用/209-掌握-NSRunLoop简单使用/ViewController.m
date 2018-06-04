//
//  ViewController.m
//  209-掌握-NSRunLoop简单使用
//
//  Created by 吴佳臻 on 2018/6/4.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.获得主线程对应的runloop
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    //2.获取当前线程对应的runloop
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    
    //0x60c0000bb660---0x60c0000bb660
    NSLog(@"%p---%p",mainRunLoop,currentRunLoop);
    
    //Core
    NSLog(@"%p",CFRunLoopGetMain());//0x6080001f3a00
    NSLog(@"%p",CFRunLoopGetCurrent());//0x6080001f3a00
    NSLog(@"%p",mainRunLoop.getCFRunLoop);//0x6080001f3a00
    
    //Runloop和线程的关系
    //一一对应，主线程的runloop已经创建，但子线程的需要手动创建
    [[[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil] start];
    
}

//在runloop中有对个运行模式，但是runloop只能选择一种模式
//mode里面至少要有一个timer或者是source
-(void)run{
    //如果创建子线程对应的runLoop，currentRunLoop是懒加载的
    NSLog(@"%@",[NSRunLoop currentRunLoop]);//<CFRunLoop 0x60c0001f7e00 [0x1080d9c80]>
    NSLog(@"run---%@",[NSThread currentThread]);//run---<NSThread: 0x60c000273140>{number = 3, name = (null)}
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
