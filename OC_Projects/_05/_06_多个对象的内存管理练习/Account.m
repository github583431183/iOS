//
//  Account.m
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Account.h"

@implementation Account

- (void)dealloc
{
    NSLog(@"%s",__func__);
    [_email release];
    [_pwd release];
    [super dealloc];
}
@end
