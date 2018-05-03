//
//  Person.h
//  _04
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property int age;

/*
 什么是类工厂方法:
 
 用于'快速'创建对象的类方法, 我们称之为类工厂方法
 类工厂方法中主要用于 给 对象分配存储空间 和 初始化这块存储空间
 
 规范:
 1.一定是类方法 +
 2.方法名称以类的名称开头, 首字母小写
 3.一定有返回值, 返回值是id/instancetype
 */

+ (instancetype)person;

+ (instancetype)personWithAge:(int)age;
@end
