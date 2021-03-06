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
@property NSString *name;

/*
 自定义构造方法:
 其实就是自定义一个init方法
 1.一定是对象方法
 2.一定返回 id/instancetype
 3.方法名称一定以 init 开头
 */
- (instancetype)initWithAge:(int)age;

// 一个类可以有0个或者多个自定义构造方法
- (instancetype)initWithName:(NSString *)name;

// 自定义构造方法可以有1个或多个参数
- (instancetype)initWithAge:(int)age andName:(NSString *)name;
@end
