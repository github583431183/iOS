//
//  Person.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

// setter 对象方法实现
- (void)setAge:(int)age
{
    _age = age;
}

- (void)setHeight:(double)height
{
    _height = height;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

// getter 对象方法实现
- (int)age
{
    return _age;
}

- (double)height
{
    return _height;
}

- (NSString *)name
{
    return _name;
}

- (void)test
{
    NSLog(@"test");
}

@end
