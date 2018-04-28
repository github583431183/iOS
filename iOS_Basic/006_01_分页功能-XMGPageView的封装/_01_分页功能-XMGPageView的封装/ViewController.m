//
//  ViewController.m
//  _01_分页功能-XMGPageView的封装
//
//  Created by 吴佳臻 on 2018/1/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "PageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PageView *pageView = [PageView pageView];
    pageView.center = self.view.center;
    // 改变pageView位置
    pageView.frame = CGRectMake(0, 20, 330, 220);
    pageView.imageNames = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    [self.view addSubview:pageView];
    // 改变 滚动的图片
//    pageView.imageNames = @[@"img_01",@"img_02"];
}


@end
