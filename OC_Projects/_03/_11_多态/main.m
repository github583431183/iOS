//
//  main.m
//  _11_多态
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"
#import "Animal.h"
#import "Person.h"
#import "Pig.h"


int main(int argc, const char * argv[]) {
    
    Dog *d = [Dog new];
    [d eat];
    
    Cat *c = [Cat new];
    [c eat];

    // 多态: 事物的'多种'表现'形态'
    // 动态类型: 在'编译'的时候'编译器'只会检查'当前类型'对应的'类'中有没有需要'调用'的方法
    // 在'运行'时,系统会'自动判断'a1的'真实类型'
    Animal *a1 = [Dog new];
    [a1 eat];
    
    // 注意点: 在多态中, 如果想调用'子类特有'的方法必须'强制类型转换'为子类才能调用
    // [a1 kanJia]; 父类 Animal 中没有 所以 需要强制类型转换 为对应的类
    Dog *d1 = (Dog *)a1;
    [d1 kanJia];

    
    Dog *d = [Dog new];
    Cat *c = [Cat new];
    Pig *p = [Pig new];
    
    [Person food:d];
    [Person food:c];
    [Person food:p];
    
    
    /*
     1.什么是多态:
     事物的多种表现形态
     
     2.在程序中如何表现:
     父类指针指向子类对象
     
     3.优点:
     提高了代码的扩展性
     
     4.注意点:
     如果父类指针指向子类对象, 
     如果需要调用'子类特有'的方法,
     必须先'强制类型转换'为子类才能调用
     */

    
    
    return 0;
}
