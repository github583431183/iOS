//
//  main.m
//  _15_NSMutableString基本概念
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    NSString *str = @"lnj"; // 一开始str指向@"lnj"对应的内存
    str = @"lmj"; // 修改了str指针的指向, 让它指向@"lmj"对应的内存
    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"l" withString:@"X"];
    NSLog(@"%@", newStr);
    
    // 创建一个空的字符串
    NSMutableString *str1 = [NSMutableString string];
    NSLog(@"修改前: %@", str1);
    [str1 appendString:@"lnj"];
    NSLog(@"修改后: %@", str1);
    
    
    NSMutableString *strM = [[NSMutableString alloc] init];
    //    strM = [NSMutableString alloc] initWithFormat:<#(NSString *), ...#>
    //    strM = [NSMutableString stringWithFormat:<#(NSString *), ...#>]
    
    return 0;
}
