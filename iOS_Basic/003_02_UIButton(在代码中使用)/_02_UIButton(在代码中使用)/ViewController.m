//
//  ViewController.m
//  _02_UIButton(在代码中使用)
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.创建按钮对象
    //UIButton *button = [[UIButton alloc] init];
    // 注意：设置按钮的类型   \
        只能在初始化的时候设置 \
            -> UIButtonTypeCustom
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //1.2设置按钮的类型(无法设置)
    // Assignment to readonly property
    //button.buttonType = UIButtonTypeInfoDark;
    
    //1.3设置frame
    button.frame = CGRectMake(100, 100, 170, 60);
    
    //1.4设置背景颜色
    //button.backgroundColor = [UIColor redColor];
    //[button setBackgroundColor:[UIColor redColor]];
    
    //1.5设置文字
    //默认形式
    //button.titleLabel.text = @"普通文字";
    //分状态
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    [button setTitle:@"高亮按钮" forState:UIControlStateHighlighted];
    
    //1.6设置文字颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    //1.7设置文字阴影
    [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    //设置阴影的偏移量
    button.titleLabel.shadowOffset = CGSizeMake(3, 2);
    
    //1.8设置内容图片
    [button setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];
    
    //1.9设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    
    
    // 2.0 加到控制器的view中
    [self.view addSubview:button];
    
    // 非常重要
    /**
     监听按钮的点击
     Target: 目标（让谁做事情）
     action: 方法（做什么事情 -> 方法）
     Events: 事件
     */
    SEL sel = @selector(clickButton:);
    [button addTarget:self //self 代表当前的 ViewController
               action:sel // 让当前的 self代表的对象 调用对应的方法
                forControlEvents:UIControlEventTouchUpInside // 相应的事件
    ];
}

- (void)clickButton:(UIButton *)button {
    button.enabled = NO;
}

@end
