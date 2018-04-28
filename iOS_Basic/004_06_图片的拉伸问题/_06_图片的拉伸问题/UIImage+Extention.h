//
//  UIImage+Extention.h
//  _06_图片的拉伸问题
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)
// 返回一张受保护的图片 (被拉伸的）
+ (instancetype)resizableImageWithLocalImageName: (NSString *)localImageName;
@end
