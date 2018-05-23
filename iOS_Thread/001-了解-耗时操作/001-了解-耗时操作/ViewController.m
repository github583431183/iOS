//
//  ViewController.m
//  001-了解-耗时操作
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //1.获得主线程
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"%@",mainThread);
    //2.获得当前县城
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"%@",currentThread);
    //3.判断住县城
    //3.1 number == 1
    //3.2 类方法
    BOOL isMainThreadA = [NSThread isMainThread];
    //3.3 对象方法
    BOOL isMainThreadB = [currentThread isMainThread];
    NSLog(@"%zd --- %zd",isMainThreadA,isMainThreadB);
}

- (IBAction)btnClick:(id)sender {
    NSLog(@"%@",[NSThread currentThread]);
    //耗时操作
    for (NSInteger i = 0; i < 100000; i++) {
        NSLog(@"%zd --- %@",i,[NSThread currentThread]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
