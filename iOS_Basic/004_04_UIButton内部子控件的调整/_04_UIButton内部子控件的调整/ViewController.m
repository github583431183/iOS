//
//  ViewController.m
//  _04_UIButton内部子控件的调整
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "MyButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.1 创建按钮
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //此处 Button 是为自定义
    UIButton *button = [MyButton buttonWithType:UIButtonTypeCustom];
    
    //1.2 设置frame
    button.frame = CGRectMake(100, 100, 170, 70);
    
    //1.3 设置背景颜色
    button.backgroundColor = [UIColor purpleColor];
    
    //1.4 设置文字
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    
    //1.5 设置内容图片
    [button setImage:[UIImage imageNamed:@"miniplayer_btn_playlist_normal"] forState:UIControlStateNormal];
    
    //1.6 按钮中的图片和文字背景
    button.imageView.backgroundColor = [UIColor yellowColor];
    button.titleLabel.backgroundColor = [UIColor blueColor];
    
    // 注意：在按钮外面改的尺寸，按钮的内部都会被覆盖掉
    // 无效，只能在自定义中修改
//    button.titleLabel.frame = CGRectMake(0, 0, 10, 10);
//    button.imageView.frame = CGRectMake(0, 0, 10, 10);
    // 无效，只能在自定义中修改
    //[button titleRectForContentRect:CGRectMake(10, 10, 10, 10)];
    //[button imageRectForContentRect:CGRectMake(10, 10, 10, 10)];

    
    [self.view addSubview:button];
    
}


@end
