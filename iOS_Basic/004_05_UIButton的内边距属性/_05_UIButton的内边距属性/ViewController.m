//
//  ViewController.m
//  _05_UIButton的内边距属性
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置按钮的内边距
    //1.设置内容
    self.button.contentEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    //2.设置图片
    self.button.imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    
    //3.设置标题
    self.button.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, -30);
}


@end
