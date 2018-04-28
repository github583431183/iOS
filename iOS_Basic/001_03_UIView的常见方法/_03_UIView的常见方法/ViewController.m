//
//  ViewController.m
//  _03_UIView的常见方法
//
//  Created by 吴佳臻 on 2018/1/10.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 红色的 view
@property (weak,nonatomic) UIView *redView;

@property (weak, nonatomic) IBOutlet UIButton *btn1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 从父容器，根据 tag 拿到对应的 view
    UIView *redView = [self.view viewWithTag:1];
    self.redView = redView;
    
    // 1.1 创建 UISwitch 对象
    UISwitch *sw = [[UISwitch alloc] init];
    
    // 1.2 加到控制器的 view 中
    [self.view addSubview:sw];
    
    // 1.3 创建 UISwithc 对象
    UISwitch *sw1 = [[UISwitch alloc] init];
    
    // 1.4 加到红色的 view
    [redView addSubview:sw1];
    
    // 1.5 创建一个选项卡对象
    UISegmentedControl *sg = [[UISegmentedControl alloc]
                              initWithItems:@[@"哈哈",@"😄",@"嘻嘻"]];
    
    // 1.6 加到红色的 view
    [redView addSubview:sg];
    
    
    // 1.7 移除
    //[sg removeFromSuperview];
    //    [self.redView removeFromSuperview];
    //    [sw removeFromSuperview];
    //[self.view removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickRemove:(UIButton *)sender {
    [self.redView removeFromSuperview];
}

#pragma mark - 伪代码---viewWithTag
/*
 - (UIView *)viewWithTag: (NSInteger)tag{
    if (self.tag == tag) return self;
    for (UIView *subView in self.subviews) {
        if (subView.tag == tag)  return subView;
        // 继续递归遍历
        // ..
    }
 }
 */

/**
 *  尽量少使用tag:
 1> tag的效率非常差
 2> tag使用多了,容易乱
 */
- (IBAction)clickBtn:(UIButton *)sender {
    
    // 做私人的事情
    /*
     if (button == self.btn1) {
        NSLog(@"点击了按钮1");
     }else if (button == self.btn2) {
        NSLog(@"点击了按钮2");
     }else{
        NSLog(@"点击了按钮3");
     }
     */
    
    switch (sender.tag) {
        case 3:
            NSLog(@"点击了按钮1");
            break;
        case 4:
            NSLog(@"点击了按钮2");
            break;
        case 5:
            NSLog(@"点击了按钮3");
            break;
        default:
            break;
    }
    
    // 做公共的事情
    NSLog(@"做公共的事情");
}

@end
