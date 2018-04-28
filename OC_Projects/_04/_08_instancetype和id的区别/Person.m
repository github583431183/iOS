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
 instancetype == id == 万能指针 == 指向一个对象
 
 id 在'编译时'不能判断对象的 真实类型
 instancetype在'编译时'可以判断对象的 真实类型

 id和instancetype
 除了一个在'编译时'不知道真实类型, 一个在'编译时'知道真实类型以外,
 还有一个区别:
 
 id 可以用来'定义变量', 可以作为'返回值', 可以作为'形参'
 instancetype '只能'用于作为 返回值

 注意: 以后但凡 '自定义构造方法' , 返回值尽量使用'instancetype', 不要使用id
 */

- (instancetype)init
//- (id)init
{
    if (self = [super init]) {
        _age = 5;
    }
    return self;
}
@end
