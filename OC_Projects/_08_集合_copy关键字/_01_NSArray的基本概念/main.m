//
//  main.m
//  _01_NSArray的基本概念
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    
    // 1. 创建 NSArray
    NSArray *arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"lnj"];
    
    // 数组中的 nil 是结束符
    arr = [NSArray arrayWithObjects:@"lnj",@"lmj",@"jjj",nil];
    NSLog(@"%@",arr);
    
    Person *p = [Person new];
    NSObject *obj = [NSObject new];
    NSArray *arr1 = [NSArray arrayWithObjects:p,obj,@"lnj",nil];
    NSLog(@"arr = %@",arr1);
    NSLog(@"count = %lu",[arr1 count]);
    
    NSLog(@"last = %@", [arr1 lastObject]);
    NSLog(@"first = %@", [arr1 firstObject]);
    NSLog(@"arr[1] = %@", [arr1 objectAtIndex:1]);
    
    //2.判断是否包含某个对象
    NSArray *arr2 = [NSArray arrayWithObjects:@"lnj", @"lmj", @"jjj", @"zs", nil];
    if([arr2 containsObject:@"zs"])
    {
        NSLog(@"arr2中包含zs");
    }else
    {
        NSLog(@"arr2中不包含zs");
    }
    
    //3.创建数组简写
    NSString *str = @"lnj";
    //NSArray *arr3 = [NSArray arrayWithObjects:@"lnj", @"lmj", @"jjj", nil];
    NSArray *arr3 = @[@"lnj", @"lmj", @"jjj"];
    // 获取数组元素的简写
    NSLog(@"%@", [arr3 objectAtIndex:0]);
    NSLog(@"%@", arr3[0]);
    
    return 0;
}
