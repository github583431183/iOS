//
//  main.m
//  _11_NSValue
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    typedef struct{
        int age;
        char *name;
        double _height;
    }Person;
    
    Person p = {30, "lnj", 1.75};
    //NSArray *arr = @[p]; p 不是 oc 对象，不能加入 NSArray
    
    
    // 1.利用NSValue包装常用的结构体
    CGPoint point = NSMakePoint(10, 20);
    NSValue *value = [NSValue valueWithPoint:point];
    NSArray *arr = @[value];
    NSLog(@"%@", arr);
    
    // 2.利用NSValue包装自定义的结构体
    // valueWithBytes: 接收一个指针, 需要传递需要包装的 结构体 的变量的地址
    // objCType: 需要传递需要包装的数据类型
    NSValue *pValue = [NSValue valueWithBytes:&p objCType:@encode(Person)];
    NSArray *arr2 = @[pValue];
    NSLog(@"%@", arr2);
    
    // 从NSValue中取出自定义的结构体变量
    Person res;
    [pValue getValue:&res];
    NSLog(@"age = %i, name = %s, height = %f", res.age, res.name, res._height);
    
    return 0;
}
