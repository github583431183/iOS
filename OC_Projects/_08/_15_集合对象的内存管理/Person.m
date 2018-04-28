//
//  Person.m
//  _15_集合对象的内存管理
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
