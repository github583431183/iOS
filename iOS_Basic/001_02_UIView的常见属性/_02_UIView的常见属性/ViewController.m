//
//  ViewController.m
//  _02_UIView的常见属性
//
//  Created by 吴佳臻 on 2018/1/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 绿色的view
@property (weak, nonatomic) IBOutlet UIView *greenView;

// 数组
@property (strong,nonatomic) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    NSLog(@"%s", __func__);
}

/**
 1. 系统调用
 2. 控制器的 view 加载完毕的时候调用
 3. 控件的初始化，数据的初始化（懒加载）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.1 查看绿色 view  的父控件
    NSLog(@"绿色的view的父控件:%@----控制器的view:%@", self.greenView.superview, self.view);
    
    // 1.2 查看绿色的view的子控件
    NSLog(@"%@", self.greenView.subviews);
    
    // 1.3 控制器的view的子控件
    NSLog(@"%@", self.view.subviews);
 
    // 1.4 控制器的view的父控件 --> UIWindow
    NSLog(@"viewDidLoad-----%@", self.view.superview);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear-----%@", self.view.superview);
}

/**
 1. 系统调用
 2. 当控制器接收到 内存警告 调用
 3. 去除一些不必要的内存,去除耗时的内存
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"内存警告");
    self.dataArr = nil;
}

- (IBAction)clickToMemoryWarning:(id)sender {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<100000000; i++) {
        UILabel *label = [[UILabel alloc] init];
        [arr addObject:label];
    }
    self.dataArr = arr;
}

@end
