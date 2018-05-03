//
//  main.m
//  _02_Property的基本使用
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [Person new];
    [p setAge:-88];
    NSLog(@"age = %i", [p age]);
    NSLog(@"_age = %i, age = %i", p.age, p.age);
    
    return 0;
}
