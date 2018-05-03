//
//  main.m
//  _15_集合对象的内存管理
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1. 如果将一个对象添加到一个数组中, 那么数组会对对象进行一个retain
        Person *p = [Person new];
        NSLog(@"reatinCount = %lu", [p retainCount]);
        
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        
        [arrM addObject:p];
        NSLog(@"reatinCount = %lu", [p retainCount]);
        
        [p release];
        NSLog(@"reatinCount = %lu", [p retainCount]);
        // 当数组对象 释放 之后, 会给数组中 所有的对象 发送一条release消息
        [arrM release];
        
        
        Person *p = [Person new]; // 1
        NSLog(@"reatinCount = %lu", [p retainCount]);
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        [arrM addObject:p]; // 2
        NSLog(@"reatinCount = %lu", [p retainCount]);
        
        [p release]; // 1
        // 当数组 移除 一个对象之后, 会给 这个对象 发送一条release消息
        [arrM removeObject:p];
    }
    return 0;
}
