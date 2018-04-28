//
//  Person.m
//  _19_自定义类实现copy
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
- (id)copyWithZone:(NSZone *)zone
{
    // 1.创建一个新的对象
    Person *p = [[[self class] allocWithZone:zone] init];
    
    // 2.设置当前对象的内容给新的对象
    p.age = _age;
    p.name = _name;
    
    // 3.返回新的对象
    return p;
}
- (id)mutableCopyWithZone:(NSZone *)zone
{
    // 1.创建一个新的对象
    Person *p = [[[self class] allocWithZone:zone] init];
    
    // 2.设置当前对象的内容给新的对象
    p.age = _age;
    p.name = _name;
    
    // 3.返回新的对象
    return p;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@, age = %i", _name, _age];
}
@end
