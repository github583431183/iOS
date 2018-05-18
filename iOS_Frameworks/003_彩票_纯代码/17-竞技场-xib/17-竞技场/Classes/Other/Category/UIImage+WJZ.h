//
//  UIImage+WJZ.h
//  09-购彩大厅
//
//  Created by 吴佳臻 on 2018/5/16.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WJZ)

/**
 *  图片不要渲染
 *
 *  @param name 图片名字
 *
 *  @return 返回一张不要渲染的图片
 */
+(UIImage *)imageWithRenderOriginalName:(NSString *)name;
@end
