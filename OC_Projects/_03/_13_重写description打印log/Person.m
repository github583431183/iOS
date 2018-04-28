//
//  Person.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setAge:(int)age
{
    _age = age;
}
- (void)setHeigth:(double)height
{
    _height = height;
}
- (void)setWeight:(double)weight
{
    _weight = weight;
}
- (void)setName:(NSString *)name
{
    _name = name;
}
- (void)setTel:(NSString *)tel
{
    _tel = tel;
}
- (void)setEmail:(NSString *)email
{
    _email = email;
}

- (int)age
{
    return _age;
}
- (double)height
{
    return _height;
}
- (double)weight
{
    return _weight;
}
- (NSString *)name
{
    return _name;
}
- (NSString *)tel
{
    return _tel;
}
- (NSString *)email
{
    return _email;
}


// 1.重写description方法, 返回我们需要打印的内容
// 2.只要利用 %@ 打印对象, 就会调用description
// 3.如果通过 %@ 打印 对象 就会调用-号开头的
// 4.如果通过 %@ 打印 类对象 就会调用+号开头的


- (NSString *)description
{
    NSLog(@"-------------");
    // 建议: 在 description方法 中尽量 不要使用'self'来 获取成员变量  \
        因为如果你经常在description方法中使用self, 可能已不小心就写成了 %@, self
    // 如果在 description方法 中利用 %@ 输出 self 会造成死循环
    // self == person实例对象
    //return [NSString stringWithFormat:@"%@", self];
    return @"xxoo";
}

// 仅仅作为了解, 开发中99%的情况使用的都是 - 号开头的description
+ (NSString *)description
{
    return @"ooxx";
}

@end
