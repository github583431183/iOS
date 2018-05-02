//
//  WJZContactItem.m
//  08-通讯录(代理逆传)
//
//  Created by 吴佳臻 on 2018/5/2.
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
