//
//  UIImage+Extention.m
//  _06_图片的拉伸问题
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "UIImage+Extention.h"

@implementation UIImage (Extention)

+ (instancetype)resizableImageWithLocalImageName:(NSString *)localImageName{
    // 创建图片对象
    UIImage *image = [UIImage imageNamed:localImageName];
    // 获取图片的尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    //返回一张拉伸且受保护的图片
    return [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
}
@end
