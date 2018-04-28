//
//  Person.m
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

/*
 1.当A对象 想 使用B对象一定要对B对象进行一次 retain，
    这样才能保证A对象存在B对象就存在
    也就是说，这样才能保证无论在什么时候在A对象中都可以使用B对象
 
 2.当A对象释放的时候，一定要对B对象进行一次 release,
    这样才能保证A对象释放了，B对象也会随之释放，避免内存泄漏
 
 3.总结一句话：有增就有减
 */
-(void)setRoom:(Room *)room
{
    // 此处有bug，多个不同的room对象后出问题,相同的room也会 +1  \
        解决方案:_04_set方法的内存管理
    // 对 Room 对象的引用计数器 +1
    [room retain];
    // 赋值本地对象
    _room = room;
}
-(Room *)room
{
    return _room;
}

-(void)dealloc
{
    // Person 对象释放了，那么 Room 对象也需要释放
    [_room release];
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
