//
//  ViewController.m
//  006_09_Masonry的使用
//
//  Created by 吴佳臻 on 2018/5/2.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //基本
    //1.蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //2.红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 添加新的约束
    //3.设置蓝色view的约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(30);
        make.bottom.equalTo(self.view.bottom).offset(-30);
        make.right.equalTo(redView.left).offset(-30);
        make.width.equalTo(redView.width);
        make.height.equalTo(50);
    }];

    //4.设置红色view的约束
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(-30);
        make.top.equalTo(blueView.top);
        make.bottom.equalTo(blueView.bottom);
    }];
    
//    // 更新约束
//    [blueView updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(80);
//    }];
//    // 删除之前所有的约束，添加新的约束
//    [blueView remakeConstraints:^(MASConstraintMaker *make) {
//
//    }];
    
    //居中
    //1.橙色view
    UIView *orangeView = [[UIView alloc] init];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    
    //2.居中约束
//    [orangeView makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@100);
//        make.height.equalTo(@100);
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.centerY.equalTo(self.view.mas_centerY);
//    }];
    
//    [orangeView makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(100);
//        make.height.equalTo(100);
//        make.centerX.equalTo(self.view.centerX);
//        make.centerY.equalTo(self.view.centerY);
//    }];

    [orangeView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 100));
        make.center.equalTo(self.view);
    }];
    
    
    //边缘
    //1.黑色view
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    //2.添加约束
//    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(20);
//        make.left.equalTo(self.view.mas_left).offset(20);
//        make.right.equalTo(self.view.mas_right).offset(-220);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-420);
//    }];
    
//    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(20);
//        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset(-220);
//        make.bottom.equalTo(self.view).offset(-420);
//    }];
    
//    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(20);
//        make.left.offset(20);
//        make.right.offset(-220);
//        make.bottom.offset(-420);
//    }];
    
//    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.offset(20);
//        make.right.bottom.offset(-20);
//    }];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
