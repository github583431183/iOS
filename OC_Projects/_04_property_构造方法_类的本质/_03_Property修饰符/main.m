//
//  main.m
//  _03_Property修饰符
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [Person new];
    
    p.height = 99;
    NSLog(@"height = %f", [p abc]);
    
    [p tiZhong:100.0];
    NSLog(@"weight = %f", [p weight]);
    
    [p setMarried:YES];
    
    if ([p isMarried]) {
        NSLog(@"已婚");
    }else
    {
        NSLog(@"未婚");
    }
    return 0;
}
