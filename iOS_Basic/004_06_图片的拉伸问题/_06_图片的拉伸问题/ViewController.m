//
//  ViewController.m
//  _06_图片的拉伸问题
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//
#import "ViewController.h"
#import "UIImage+Extention.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // 1.1创建UIImage对象
    // UIImage 分类 新增的方法 resizableImageWithLocalImageName
    UIImage *image2 = [UIImage resizableImageWithLocalImageName:@"chat_send_nor"];
    
    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    
    //1.2 拿到image的尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    //1.3 返回一张受保护而且拉伸的图片 --->CapInsets: 哪些地方要保护
    // 上，左，下，右
    //CGFloat top, CGFloat left, CGFloat bottom, CGFloat right
    //方式一
    UIImage *resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight * 0.5 -1, imageWidth * 0.5 - 1)];// 默认平铺
    /*
    UIImageResizingModeTile, 平铺
    UIImageResizingModeStretch, 拉伸(伸缩)
     */
    UIImage *resizableImageMode = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight * 0.5 -1, imageWidth * 0.5 - 1) resizingMode:UIImageResizingModeStretch];
    
    //方式二
    // 右边需要保护的区域 = 图片的width - leftCapWidth - 1
    // （bottom cap）下边需要保护的区域 = height - topCapHeight - 1
    UIImage *stretchableImage = [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
    //2.把图片设置到按钮上
    [self.button setBackgroundImage:stretchableImage forState:UIControlStateNormal];
}


@end
