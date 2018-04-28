//
//  ViewController.m
//  006_05_Autolayout代码
//
//  Created by 吴佳臻 on 2018/1/17.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.绿的view
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    // 禁止autoresizing自动转为约束
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:greenView];
    
    //2.添加约束
    //2.1 宽度约束
    NSLayoutConstraint *wlcs = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [greenView addConstraint:wlcs];
    // 2.2 高度约束
    NSLayoutConstraint *hlcs = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [greenView addConstraint:hlcs];
    
    // 2.3 右边约束
    NSLayoutConstraint *rlcs = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rlcs];
    
    // 2.4 顶部约束
    NSLayoutConstraint *toplcs = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:toplcs];
    
    
    //3.蓝色的view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    //禁止autoresizing自动转为约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //4.红色的view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    //禁止autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    /* 添加约束 */
    //5.添加蓝色view的约束
    //5.1左边约束
    NSLayoutConstraint *leftlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [self.view addConstraint:leftlcs_b];
    
    //5.2底部约束
    NSLayoutConstraint *bottomlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30];
    [self.view addConstraint:bottomlcs_b];
    
    //5.3右边约束
    NSLayoutConstraint *rightlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_b];
    
    //5.4宽度约束
    NSLayoutConstraint *wlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:wlcs_b];
    
    //5.5高度约束
    NSLayoutConstraint *hlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
    [blueView addConstraint:hlcs_b];
    
    // 6.添加红色view的约束
    // 6.1 右边的约束
    NSLayoutConstraint *rightlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_r];
    
    // 6.2 顶部对齐
    NSLayoutConstraint *toplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:toplcs_r];
    
    //6.3 底部对齐
    NSLayoutConstraint *bottomlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:bottomlcs_r];
    
    
}


@end
