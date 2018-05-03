//
//  main.m
//  _08_常见错误
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 函数和方法的区别
 1.函数属于整个文件, 方法属于某一个类
    方法如果离开'类'就不行
 2.函数可以直接调用, 方法必须用 对象 或者 类 来调用
    注意: 虽然函数属于整个文件, 但是如果把 函数 写在 类的声明 中会 不识别
 3.不能把函数当做方法来调用, 也不能把方法当做函数来调用
 
 方法的注意点:
 >方法可以 没有声明 只有 实现
 >方法可以 只有声明没有实现, 编译不会报错, 但是运行会报错
 方法的常见错误
 1.如果方法 只有声明没有实现, 那么运行时会报:
 reason: '+[Person demo]: unrecognized selector sent to class 0x100001140'
 2.发送了一个不能识别的消息, 在Person类中没有+开头的demo方法
 reason: '-[Person test]: unrecognized selector sent to instance 0x100400000'
 
 类的注意点:
 类可以只有实现没有声明
 注意: 在开发中不建议这样写

 3.@interface和@implementation嵌套
 4.成员变量没有写在{}里面
 5.方法的声明写在了{}里面
 6.成员变量不能在{}中进行初始化、不能被直接拿出去访问
 7.方法不能当做函数一样调用
 8.OC方法 只能 声明 在@interface和@end之间，
    只能 实现 在@implementation和@end之间。
    也就是说OC方法不能独立于类存在
 9.C函数 不属于类，跟类没有联系，C函数只归属于定义函数的文件所有
 10.C函数不能访问OC对象的成员
 11.低级错误：方法有声明，但是实现的时候写成了函数
 12.OC 可以 没有@interface同样可以定义一个类
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
