//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

/*
 + (instancetype)person
 {
 Person *p = [Person alloc];
 Person *p1 = [p init];
 return p1;
 }
 */
+ (instancetype)person
{
    //    return [[Person alloc] init];
    // 注意: 以后但凡自定义类工厂方法,  \
        在 类工厂方法 中创建 对象 一定不要使用类名来创建 \
        一定要使用'self'来创建 \
        'self'在 类方法 中就代表 类对象, 到底代表哪一个类对象呢?  \
        谁调用 当前方法, self就代表 谁
    return [[self alloc] init];

}

+ (instancetype)personWithAge:(int)age
{
    //    Person *p = [[Person alloc] init];
    Person *p = [[self alloc] init];
    p.age = age;
    return p;
}

@end
