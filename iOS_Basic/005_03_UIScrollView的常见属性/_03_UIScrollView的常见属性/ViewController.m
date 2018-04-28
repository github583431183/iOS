//
//  ViewController.m
//  _03_UIScrollView的常见属性
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
//    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    indicatorView.center = CGPointMake(100, -40);
//    [indicatorView startAnimating];
//    [self.scrollView addSubview:indicatorView];
    
    //1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [self.scrollView addSubview:imageView];
    NSLog(@"11--->%@",self.scrollView.subviews);
    //2.设置contentSize
    self.scrollView.contentSize = image.size;
    //3.是否有弹簧效果
//    self.scrollView.bounces = NO;
    //4.不管有没有设置contentSize，总是有弹簧效果（下拉刷新）
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    //5.是否显示滚动条
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    NSLog(@"22--->%@",self.scrollView.subviews);
    //注意：\
        千万不要通过索引去 subviews 数组访问 UIScrollView 子控件
    [self.scrollView.subviews.firstObject removeFromSuperview];
}


@end
