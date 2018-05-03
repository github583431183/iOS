//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"


@implementation Person

/**
 1.只要 程序启动 就会将所有 '类的代码' 加载到'内存中', 放到'代码区'
 2.'load方法' 会在当前类被加载到'内存的'时候调用, 有且仅会调用 一次
 3.如果存在 '继承关系', 会先调用 '父类' 的load方法, 再调用 '子类' 的load方法
 */
+ (void)load
{
    NSLog(@"Person类被加载到内存了");
}

/**
 1.initialize 方法 当 当前类'第一次 被使用的时候就会调用(创建'类对象'的时候)
 
 2.initialize 方法 在整个程序的运行过程中只会被'调用一次',
    无论你使用多少次这个类都只会调用一次
 
 3.initialize 用于对'某一个类'进行'一次性'的初始化

 4.initialize 和 load 一样, 如果存在'继承关系',
    会先调用'父类'的initialize再调用'子类'的initialize
 */
+ (void)initialize
{
    NSLog(@"Person initialize");
}


@end
