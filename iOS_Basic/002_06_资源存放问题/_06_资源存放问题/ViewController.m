//
//  ViewController.m
//  _06_资源存放问题
//
//  Created by 吴佳臻 on 2018/1/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

/*
 加载图片的方式:
    1. imageNamed:
    2. imageWithContentsOfFile:
 1. 加载Assets.xcassets这里的图片
    1. 打包后变成Assets.car
    2. 拿不到路径
    3. 只能通过imageName:来加载图片
    4. 不能通过imageWithContentsOfFile:来加载图片
 
 2. 放到项目中的图片
    1. 可以拿到路径
    2. 能通过imageNamed:来加载图片
    3. 也能通过imageWithContentsOfFile:来加载图片
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // 图片的设置方式
    // 方式一:
    //self.imageView.image = [UIImage imageNamed:@"1"];
    // 方式二:
    // 路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
    self.imageView.image = [UIImage imageWithContentsOfFile:path];
    
    self.imageView.image=nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
