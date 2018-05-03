//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person


/**
 默认构造方法

 @return self
 */
- (instancetype)init
{
    if (self = [super init]) {
        _age = 10;
    }
    return self;
}


/**
 重写 打印方法

 @return %@
 */
- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %i, name = %@", _age, _name];
}


/**
 一个参数的构造方法实现

 @param age
 @return self
 */
- (instancetype)initWithAge:(int)age
{
    if (self = [super init]) {
        _age = age;
    }
    return self;
}


/**
 一个参数的构造方法实现

 @param name name
 @return self
 */
- (instancetype)initWithName:(NSString *)name
{
    if (self  =[super init]) {
        _name = name;
    }
    return self;
}


/**
 两个参数的构造方法实现

 @param age age
 @param name name
 @return self
 */
- (instancetype)initWithAge:(int)age andName:(NSString *)name
{
    if (self = [super init]) {
        _age = age;
        _name = name;
    }
    return self;
}
@end
