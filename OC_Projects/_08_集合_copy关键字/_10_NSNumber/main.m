//
//  main.m
//  _10_NSNumber
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
    int age = 10;
    double number= 5.1;
    int value =  6;
    // 非对象不能加入 NSArray
    //NSArray *arr =  @[age, number, value];
    // 1.将基本数据类型转换为对象类型
    NSNumber *ageN = [NSNumber numberWithInt:age];
    NSNumber *numberN = [NSNumber numberWithDouble:number];
    NSNumber *valueN = [NSNumber numberWithInt:value];
    
    NSArray *arr = @[ageN, numberN, valueN];
    NSLog(@"arr = %@", arr);
    
    
    // 2. 将 对象类型 转换为 基本数据类型
    int tempI = [ageN intValue];
    double tempD = [numberN doubleValue];
    NSLog(@"%f", tempI);
    NSLog(@"%f", tempD);
    
    // 3.基本数据类型 转换 对象类型简写
    // 注意:      \
            如果传入的是变量那么必须在@后面写上(), 如果传入的常量, 那么@后面的()可以省略
    //NSNumber *temp = @(number);
    NSNumber *temp = @10.10;
    NSLog(@"%@", temp);
    
    return 0;
}
