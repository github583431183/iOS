//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"
@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        _age = 10;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %i, name = %@", _age, _name];
}

- (instancetype)initWithAge:(int)age
// 注意: 自定义构造方法中的 init 后面的 With 的 W 一定要大写
//- (instancetype)initwithAge:(int)age
{
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    if (self  =[super init]) {
        _name = name;
    }
    return self;
}

- (instancetype)initWithAge:(int)age andName:(NSString *)name
{
    if (self = [super init]) {
        _age = age;
        _name = name;
    }
    return self;
}
@end
