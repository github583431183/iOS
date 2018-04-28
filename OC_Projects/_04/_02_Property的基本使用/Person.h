//
//  Person.h
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 Xocde4.4之前
 @porperty 是一个编译器指令
 可以使用@porperty来代替getter/setter方法的'声明'
 也就是说我们只需要写上@porperty就不用写getter/setter方法的声明
 
 编译器只要看到@property, 就知道我们要生成某一个属性的getter/setter方法的声明

 ／／／／／／／／／／／／／／
 @property int age;
 
 - (void)setAge:(int)age;
 - (int)age;
 ／／／／／／／／／／／／／／
 
 @synthesize 是一个编译器指令,
 它可以简化我们getter/setter方法的'实现'
 
 什么是'实现':
 在@implementation用声明后面写上大括号就代表着实现
 
 1.在@synthesize后面告诉编译器, 需要实现哪个@property生成的声明
 2. 告诉@synthesize, 需要将传入的值赋值给谁和返回谁的值给调用者
 
 ／／／／／／／／／／／／／／
 @synthesize age;
 ／／／／／／／／／／／／／／
 
 
 Xcode4.4以后
 apple对@property进行了一个增强, 
 以后只要利用一个 @property 就可以同时生成setter/getter方法的声明和实现
 
 如果没有告诉 @property 要将传入的参数赋值给谁,
 默认@property会将传入的属性赋值给 _ 开头的成员变量
 
 @property有一个弊端:
    它只会生成最简单的getter/setter方法的声明和实现, 并不会对传入的数据进行过滤
 
 如果想对传入的数据进行过滤, 那么我们就必须 '重写' getter/setter方法
 如果不想对传入的数据进行过滤, 仅仅是提供一个方法给外界操作成员变量, 那么就可以使用@property
 
 如果利用 @property 来生成getter/setter方法, 那么我们可以不写成员变量, 系统会自动给我们生成一个 _ 开头的成员变量
 
 注意: @property 自动帮我们生成的成员变量是一个'私有'的成员变量,
    也就是说是在'.m文件'中生成的, 而不是在'.h文件'中生成的
*/

@interface Person : NSObject
@property int age;
@end
