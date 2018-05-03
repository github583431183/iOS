//
//  main.m
//  _09_OC中的常用结构体
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    // 注意：  \
        在开发中苹果推荐我们使用CG开头的结构体, 也就是说NS开头的结构体一般不用
    // 1.保存坐标的
    NSPoint;
    CGPoint point = NSMakePoint(10, 20);
    
    // 2.保存尺寸的
    NSSize;
    CGSize size = NSMakeSize(100, 50);
    
    // 3.保存坐标和尺寸
    NSRect;
    CGRect rect = NSMakeRect(10, 20, 100, 50);
    
    
    
    
    return 0;
}
