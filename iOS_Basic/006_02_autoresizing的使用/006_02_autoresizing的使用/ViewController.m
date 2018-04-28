//
//  ViewController.m
//  006_02_autoresizing的使用
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
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    CGFloat X = self.view.frame.size.width - 100;
    CGFloat Y = self.view.frame.size.height - 100;
    redView.frame = CGRectMake(X, Y, 100, 100);
    
    /*
     UIViewAutoresizingFlexibleLeftMargin 距离父控件的左边是可以伸缩的
     UIViewAutoresizingFlexibleBottomMargin 距离父控件的底部是可以伸缩的
     UIViewAutoresizingFlexibleRightMargin 距离父控件的右边是可以伸缩的
     UIViewAutoresizingFlexibleTopMargin 距离父控件的顶部是可以伸缩的
     UIViewAutoresizingFlexibleHeight  高度会跟随父控件的高度进行伸缩
     UIViewAutoresizingFlexibleWidth  宽度会跟随父控件的宽度进行伸缩
     */
    redView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:redView];
}


@end
