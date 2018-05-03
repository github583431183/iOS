//
//  main.m
//  _05_MRC中的property修饰符
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Person *p = [Person new];
        Room *r = [Room new];
        
        /*
         Car *c =[Car new];
         Dog *d = [Dog new];
         
         
         p.room = r;
         p.car = c;
         p.dog = d;
         
         [d release];
         [c release];
         [r release];
         [p release];
         */
        
        p.room = r;
        [r release];
        // 重复赋值
        p.room = r;
        
        Room *r2 = [Room new];
        // 换新的 Room 对象
        p.room = r2;
        [r2 release];
        
        [p release];

    }
    return 0;
}
