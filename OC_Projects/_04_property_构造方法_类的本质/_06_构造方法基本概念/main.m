//
//  main.m
//  _06_构造方法基本概念
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    /*
     在OC中 init开头的方法, 我们称之为 构造方法
     构造方法的用途: 用于初始化一个对象, 让某个对象一创建出来就 拥有某些属性和值
     */
    Person *p = [[Person alloc] init];
    //    p.age = 6;
    NSLog(@"%i", p.age);
    
    Person *p2 = [[Person alloc] init];
    //    p2.age = 6;
    NSLog(@"%i", p2.age);
    
    Person *p3 = [[Person alloc] init];
    //    p3.age = 6;
    NSLog(@"%i", p3.age);
    
    return 0;
}
