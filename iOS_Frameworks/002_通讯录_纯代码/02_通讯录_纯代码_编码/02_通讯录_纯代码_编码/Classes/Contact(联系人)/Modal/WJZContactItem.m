//
//  WJZContactItem.m
//  01_通讯录_纯代码_框架搭建
//
//  Created by 吴佳臻 on 2018/5/14.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZContactItem.h"

@implementation WJZContactItem
+(instancetype)itemWithName:(NSString *)name phone:(NSString *)phone{
    WJZContactItem *item = [[WJZContactItem alloc] init];
    item.name = name;
    item.phone = phone;
    return item;
}
@end
