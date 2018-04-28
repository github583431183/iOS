//
//  ViewController.m
//  _02_通过xib自定义商品的View
//
//  Created by 吴佳臻 on 2018/1/13.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "ShopView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载xib
   
//     ShopView *shopView = [[[NSBundle mainBundle] loadNibNamed:@"XibView" owner:nil options:nil] firstObject];
//    ShopView *shopView = [[ShopView alloc] initWithFrame:CGRectMake(100, 100, 80, 100)];
    
    ShopView *shopView = [ShopView shopView];
    shopView.frame = CGRectMake(100, 100, 80, 100);
    
    // 给子控件设置属性
    /*
    UIImageView *imageView = [shopView viewWithTag:100];
    UILabel *titleLabel = [shopView viewWithTag:200];
    
    imageView.image = [UIImage imageNamed:@"danjianbao"];
    titleLabel.text = @"单肩包";
     */
    [shopView setName:@"单肩包"];
    [shopView setIcon:@"danjianbao"];
    
    [self.view addSubview:shopView];
}

@end
