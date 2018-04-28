//
//  ViewController.m
//  _01_xib的基本使用
//
//  Created by 吴佳臻 on 2018/1/13.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示 xib
    // 方式一
    UIView *carView = [[[NSBundle mainBundle] loadNibNamed:@"CarView" owner:nil options:nil] firstObject];
    carView.frame = CGRectMake(0, 300, 200, 50);
//    carView.clipsToBounds = YES; //将边框外的 View 修剪掉
    [self.view addSubview:carView];
    
    // 方式二
    UINib *nib = [UINib nibWithNibName:@"CarView" bundle:nil];
    UIView *carView2 = [[nib instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview:carView2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
