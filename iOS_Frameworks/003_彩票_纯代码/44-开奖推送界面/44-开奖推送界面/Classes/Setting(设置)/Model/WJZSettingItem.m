//
//  WJZSettingItem.m
//  36-搭建设置界面(MVC)
//
//  Created by 吴佳臻 on 2018/5/22.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZSettingItem.h"

@implementation WJZSettingItem
+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title{
    WJZSettingItem *item = [[self alloc] init];
    
    item.icon = icon;
    
    item.title = title;
    
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithIcon:nil title:title];
}
@end
