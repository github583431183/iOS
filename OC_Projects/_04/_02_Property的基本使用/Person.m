//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

// 如果重写了setter方法, 那么property就只会生成getter方法
// 如果重写了getter方法, 那么property就只会生成setter方法
// 如果同时重写了getter/setter方法, 那么@property就不会自动帮我们生成'私有'的成员变量
- (void)setAge:(int)age
{
    // 重写 setter 方法 过滤赋值
    if (age < 0) {
        age = 0;
    }
    _age = age;
}


@end
