//
//  main.m
//  _01_私有变量和私有方法
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [Person new];
     //无论使用什么 成员变量修饰符 修饰 成员变量, 我们都可以在其它类中看到这个变量
     //只不过有得修饰符修饰的变量我们不能操作而已
    /*
    p->_age;
    p->_height;
    p->_name;
    p->_weight;
   
     */
    
    // p->_score; //无法被访问
    
    //  [p test]; // 无法被访问
    
    [p performSelector:@selector(test)];
    
    // id 多态的一种
    id pp = [Person new];
    [pp test];
    
    return 0;
}
