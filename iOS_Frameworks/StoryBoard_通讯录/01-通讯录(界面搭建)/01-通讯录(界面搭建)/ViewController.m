//
//  ViewController.m
//  01-通讯录(界面搭建)
//
//  Created by 吴佳臻 on 2018/4/28.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 -[AppDelegate application:didFinishLaunchingWithOptions:]
 -[ViewController viewDidLoad]
 -[AppDelegate applicationDidBecomeActive:]
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // 在加载视图后，通常从nib中执行任何额外的设置。
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 处理任何可以重新创建的资源。
    // Dispose of any resources that can be recreated.
    NSLog(@"%s",__func__);
}


@end
