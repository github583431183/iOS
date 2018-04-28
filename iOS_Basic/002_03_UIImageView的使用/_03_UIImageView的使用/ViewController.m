//
//  ViewController.m
//  _03_UIImageView的使用
//
//  Created by 吴佳臻 on 2018/1/11.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] init];
    //2.设置chicun
    //imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView.frame = self.view.bounds;
    //3.设置背景颜色
    //imageView.backgroundColor = [UIColor redColor];
    //4.设置图片 (png不需要后缀)
    imageView.image = [UIImage imageNamed:@"1"];
    
    /**
     
     UIViewContentModeRedraw, // 重新绘制 (核心绘图) drawRact
     
     //带有Scale,标明图片有可能被拉伸或压缩
     UIViewContentModeScaleToFill, // 完全的压缩或拉伸
     
     // Aspect 比例,缩放是带有比例的
     UIViewContentModeScaleAspectFit, // 宽高比不变 Fit 适应
     UIViewContentModeScaleAspectFill, // 宽高比不变 Fill 填充
     
     //不带有Scale,标明图片不可能被拉伸或压缩
     UIViewContentModeCenter,
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     */
    //5.设置图片的内容模式
    imageView.contentMode = UIViewContentModeScaleToFill;
    //6.毛玻璃
    //6.1 创建UIToolbar对象
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    //6.2 设置toolBar的frame
    toolBar.frame = imageView.bounds;
    //6.3 设置毛玻璃的样式
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.alpha = 0.98;
    //6.4加到imageView中
    [imageView addSubview:toolBar];
    
    //7.加到控制器的view中
    [self.view addSubview:imageView];
    
    // 裁剪多余的部分
    imageView.clipsToBounds = YES;
}



@end
