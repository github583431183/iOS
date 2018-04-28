//
//  ViewController.m
//  _06_UIScrollView的代理的注意点
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
@interface ViewController ()
// 车
@property (strong,nonatomic)Car *car;
@end

/*
 1.任何 OC 对象都可以成为 scrollView 的代理
 2.苹果设计的代理是 weak
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(0, 20, 300, 200);
    [self.view addSubview:scrollView];
    
    //2.创建UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    
    //3.设置contentSize
    scrollView.contentSize = image.size;
    
    //4.设置代理
    self.car = [[Car alloc] init];
    scrollView.delegate = self.car;
}


@end
