//
//  main.m
//  _09_匿名对象
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    
    // 匿名就是没有名字, 匿名对象就是没有名字的对象
    
    // 1.有名字的对象
    // 只要用一个指针保存了某个对象的地址, 我们就可以称这个指针为某个对象
    // 称p为Person对象
    Person *p =[Person new]; // p = 0ffc12
    p->_age = 30;
    p->_name= @"lnj";
    [p say];
    
    /*
     0ffc12->_age = 30;
     0ffc12->_name= @"lnj";
     [0ffc12 say];
     
     */
    
    // 2.没有名字的对象
    // 无论有没有名字, 只要调用new方法都会返回对象的地址
    // 每次new都会新开辟一块存储空间
    [Person new]->_age = 30;
    [Person new]->_name = @"哈哈";
    [[Person new] say];

    
    // 3.匿名对象的应用场景
    // 3.1当对象只需要使用一次的时候就可以使用匿名对象
    Iphone *phone = [Iphone new]; // phone = 0ffb11
    [phone brand]; // [0ffb11 brand];
    
    // 可以修改为匿名对象调用 对象方法
    [[Iphone new] brand]; // [0fff5 brand];
    
    // 3.2匿名对象可以作为方法的参数(实参)
    Person *p1 = [Person new];
    Iphone *phone1 = [Iphone new];
    [p1 signal:phone1];
    
    [p1 signal:[Iphone new]];
    

    
    return 0;
}
