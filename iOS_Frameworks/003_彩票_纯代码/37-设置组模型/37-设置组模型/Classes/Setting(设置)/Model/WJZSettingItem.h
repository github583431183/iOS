//
//  WJZSettingItem.h
//  36-搭建设置界面(MVC)
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZSettingItem : NSObject
/** 图片 */
@property (nonatomic, strong) UIImage *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
@end
