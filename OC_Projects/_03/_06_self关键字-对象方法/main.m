//
//  main.m
//  _06_self关键字-对象方法
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {
   
    
    Iphone *p = [Iphone new];
    NSLog(@"p = %p", p);// p == self == 0x100403420
    [p carameWithFlahlightStatus:kFlahlightStatusOpen];
    
    return 0;
}
