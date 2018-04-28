//
//  main.m
//  _08_继承的基本概念
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Iphone.h"
#import "Android.h"
int main(int argc, const char * argv[]) {
    
    /*
     当前代码存在的问题：重复代码太多
     
     可以利用继承来解决当前重复代码太多的问题
     
     只需要A继承了B类
     那么A类就拥有了B类的所有属性和方法（对象方法和类方法）
     */
    
    Iphone *p = [Iphone new];
    [p signalWithNumber:@"123456789"];
    
    Android *a = [Android new];
    [a signalWithNumber:"123456789"];
    
    [Iphone brand];
    [Android brand];
    
    [p setCpu:100];
    NSLog(@"cpm = %i",[p cpu]);
    return 0;
}
