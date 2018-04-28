//
//  ViewController.m
//  006_06_Vfl
//
//  Created by 吴佳臻 on 2018/3/5.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.蓝色的view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    // 禁止使用autoresizing自动转为约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    // 2.红色的view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    // 禁止使用autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
//    // 3. 添加约束
//    // 3.1 水平方向
//    NSString *hvfl = @"H:|-space-[abc]-space-|";
//    NSDictionary *views = @{@"abc" : redView};
//    NSDictionary *metrics = @{@"space" : @40};
//    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:kNilOptions metrics:metrics views:views];
//    [self.view addConstraints:hlcs];
//
//    // 3.2 垂直方向
//    NSString *vvfl = @"V:[abc(40)]-space-|";
//    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
//    [self.view addConstraints:vlcs];
    
    
    // 3.添加约束
    // 3.1 水平方向
    //    NSDictionary *views = @{
    //                            @"redView" : redView,
    //                            @"blueView" : blueView
    //                            };
    NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView);
    
    NSDictionary *metrics = @{@"space" : @30};
    NSString *hvfl = @"H:|-space-[blueView]-space-[redView(==blueView)]-space-|";
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    
    // 3.2 垂直方向
    NSString *vvfl = @"V:[blueView(50)]-space-|";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:vlcs];
    
}



@end
