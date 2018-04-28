//
//  ViewController.m
//  _01_UIScrollView的基本使用
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.红色的 View
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 50, 50);
    [self.scrollView addSubview:redView];
    
    // *默认* scrollView设置该属性为 YES
//    self.scrollView.clipsToBounds = YES;
    //2.设置内容尺寸（滚动范围）
    //可滚动尺寸：    \
        contentSize的尺寸 减去 scrollView的尺寸 \
    注意：\
        contentSize的尺寸小于等于scrollView的尺寸也是不可以滚动的
    self.scrollView.contentSize = CGSizeMake(325, 255);
    //3.是否能滚动
    self.scrollView.scrollEnabled = YES;
    //4.是否能够跟用户交互（响应用户的点击等操作）\
    注意：\
        设置 userInteractionEnabled = NO  ,\
        scrollView以及内部所有的子控件都不能跟用户交互了
    self.scrollView.userInteractionEnabled = YES;
    
    UIButton *btn = nil;
    btn.enabled = NO;
    btn.userInteractionEnabled = NO;

    UIControlStateNormal;
    UIControlStateHighlighted;
    // 注意：\
        只有设置按钮的enabled = NO才能达到这个状态 \
        设置按钮的userInteractionEnabled = NO是到不到这个状态的
    UIControlStateDisabled;
    
}


@end
