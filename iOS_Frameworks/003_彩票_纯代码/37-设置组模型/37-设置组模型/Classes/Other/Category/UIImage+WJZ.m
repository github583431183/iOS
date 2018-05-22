//
//  UIImage+WJZ.m
//  09-购彩大厅
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "UIImage+WJZ.h"

@implementation UIImage (WJZ)

+(UIImage *)imageWithRenderOriginalName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
