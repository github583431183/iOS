//
//  Person.h
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
#import "Car.h"
#import "Dog.h"
@interface Person : NSObject
{
    Room *_room;
    Car *_car;
    Dog *_dog;
}

/*
 - (void)setRoom:(Room *)room;
 - (void)setCar:(Car *)car;
 - (void)setDog:(Dog *)dog;
 
 - (Room *)room;
 - (Car *)car;
 - (Dog *)dog;
 */


/*
 property 中的修饰符
 
 1.相同类型的property修饰符 不能 同时使用
 2.不同类型的property修饰符 可以多个结合在一起使用
    多个之间用,号隔开
 3.iOS开发中只要写上property , 那么就立刻写上 nonatomic
 
 4. atomic(原子的) 在多线程中使用
 
    atomic : 性能低（默认）
    nonatomic : 性能高
    在iOS开放中99.99%都写nonatomic
 
 5.常见的property 中的修饰符
    5.1 readonly: 只会生成getter方法
    5.2 readwrite: 既会生成getter也会生成setter,
            什么都不写'默认'就是readwrite
 
    5.3 getter: 可以给生成的getter方法起一个名称
        setter: 可以给生成的setter方法起一个名称
 
    5.4 retain: 就会'自动'帮我们生成 getter / setter 方法的内存管理代码
        assign: 不会帮我们生成 setter方法 内存管理的代码,
            仅仅只会生成'普通的' getter / setter方法, 
            什么都不写'默认'就是assign
 */

@property(nonatomic, retain) Room *room;

@end
