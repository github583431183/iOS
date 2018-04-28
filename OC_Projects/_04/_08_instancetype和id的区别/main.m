//
//  main.m
//  _08_instancetype和id的区别
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *p  =[[Person alloc] init];
    [p setAge:99];
    /*
     如果init方法的返回值是'instancetype',
     那么将'返回值'赋值给一个'其它的对象'会报一个警告
     如果是在以前, init的返回值是'id',
     那么将init返回的对象地址赋值给'其它对象'是不会报错的
     */
  //  NSString *str = [[Person alloc] init];
    
    id p3 = [[Person alloc] init];
    //instancetype p1 = [[Person alloc] init];
    
   // NSUInteger length = [str length];
   // NSLog(@"length = %lu", length);
    
    return 0;
}

