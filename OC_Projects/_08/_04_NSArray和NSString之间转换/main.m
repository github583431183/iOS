//
//  main.m
//  _04_NSArray和NSString之间转换
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    NSArray *arr = @[@"lnj", @"lmj", @"jjj"];
    // 需求：用-将所有的姓名连接起来生成一个字符串
    
    // 方式一：
    // 1. 定义一个可变字符串保存拼接之后的结果
    NSMutableString *strM = [NSMutableString string];
    // 2.遍历数组，取出数组中的每一个元素，将元素添加到可变字符串中
    for (NSString *str in arr) {
        [strM appendString:str];
        // 3.每次添加完毕之后再添加一个 -
        [strM appendString:@"-"];
    }
    // 4. 删除最后一个 -
    [strM deleteCharactersInRange:NSMakeRange(strM.length - 1, 1)];
    NSLog(@"strM = %@", strM);
    
    // 方式二：
    NSString *str = [arr componentsJoinedByString:@"-"];
    NSLog(@"str = %@", str);
    
    
    // 通过一个字符串生成一个数组
    // 也叫做字符串切割
    NSString *str2 = @"lnj**lmj**jjj";
    NSArray *arr2 = [str2 componentsSeparatedByString:@"**"];
    NSLog(@"arr2 = %@", arr2);
    
    return 0;
}
