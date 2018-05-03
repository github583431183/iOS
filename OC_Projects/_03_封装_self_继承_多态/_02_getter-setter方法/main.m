//
//  main.m
//  _02_getter-setter方法
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    Gun *gun = [Gun new];
    
    [gun setSize:5];
    NSLog(@"size = %i", [gun size]);
    
    return 0;
}
