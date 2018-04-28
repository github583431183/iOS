//
//  main.m
//  _04_点语法
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [Person new];
    
    // 指针 方式
     p->_age = 30;
     p->_name = @"haha";
     p->_height = 1.75;
     
     NSLog(@"age = %i, name = %@, height = %f", p->_age, p->_name, p->_height);
    
    // setter 方式
     [p setName:@"haha"];
     [p setAge:30];
     [p setHeight:1.75];
     NSLog(@"age = %i, name = %@, height = %f", [p age], [p name], [p height]);
    
    /*
     1.如果给属性提供了getter和setter方法, 
        那么访问属性就又多了一种访问方式 , 点(.)语法
     
     2.点(.)语法其实它的本质是调用了我们的setter和getter方法
     3.点(.)语法是一个编译器的特性, 会在程序编译时翻译成二进制的时候将点(.)语法自动转换为setter和getter方法
     4.如果点(.)语法在=号的左边, 那么编译器会自动转换为setter方法
     5.如果点(.)语法在=号的右边, 或者没有等号, 那么编译器就会自动转换为getter方法
     */
    p.name = @"haha";// [p setName:@"haha"];
    p.age = 30;
    p.height = 1.75;
    NSLog(@"age = %i, name = %@, height = %f", p.age, p.name, p.height);
    //     p.age -> [p age];
    
    /*
     点(.)语法的注意点:
     点(.)语法一般用于给'成员变量'赋值, 
     如果不是给'成员变量'赋值一般情况下不建议使用, 但是也可以使用
     
     */
    p.test; // [p test];
    return 0;
}
