//
//  main.m
//  _03_getter-setter方法练习
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kline.h"
/*
 设计一个K线类, 
 有三个属性, 最高价格, 最低价格, 平均价格.
 要求可以设置和获取这三个属性
 */
int main(int argc, const char * argv[]) {
    
    // 1.创建K线类
    Kline *line = [Kline new];
    // 2.设置属性
    [line setMax:200];
    [line setMin:100];
    
    // 3.获取属性的值
    NSLog(@"min = %i, max = %i, average = %i",
          [line min], [line max], [line average]);
    
    [line average];
    [line average];
    [line average];
    [line average];
    return 0;
}
