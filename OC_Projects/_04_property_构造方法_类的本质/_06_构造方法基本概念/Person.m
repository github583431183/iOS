//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

/*
  重写init方法, 在init方法中初始化成员变量
  注意: 重写init方法必须按照'苹果规定'的格式重写, 如果不按照规定会引发一些未知的错误
  1.必须先初始化父类, 再初始化子类
  2.必须判断父类是否初始化成功, 只有父类初始化成功才能继续初始化子类
  3.返回当前对象的地址
 */

/*
- (instancetype)init
{
    // 1.初始化父类 \
    只要父类初始化成功 , 就会返回对应的地址,  \
    如果初始化失败, 就会返回nil   \
    nil == 0 == 假 == 没有初始化成功
    self = [super init];
    // 2.判断父类是否初始化成功
    if (self != nil) {
        // 3.初始化子类   \
        设置属性的值
        _age = 6;
        
    }
    // 4.返回地址
    return self;
}

- (instancetype)init
{
    self = [super init]; // self == nil == 0
    if (self) {
        // 初始化子类
        _age = 6;
    }
    return self;
}

 */

- (instancetype)init
{
    // self = [super init];  \
        注意: 不要把 = 号写为 ==   \
        一定要将[super init]的返回值赋值给self
    if (self = [super init]) {
        // 初始化子类
        _age = 6;
    }
    return self;
}

@end
