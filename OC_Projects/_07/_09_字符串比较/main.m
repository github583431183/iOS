//
//  main.m
//  _09_字符串比较
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str1 = @"abc";
    NSString *str2 = @"ABC";
    
    // 比较两个字符串的“内容”是否相同
    BOOL flag1 = [str1 isEqualToString:str2];
    NSLog(@"flag = %i",flag1);
    
    // 下面方法是比较两个字符串的“地址”是否相同
    flag1 = (str1==str2);
    NSLog(@"flag = %i",flag1);
    
    // 比较字符串的大小
    // NSOrderedAscending  前面的小于后面的
    // NSOrderedSame,  两个字符串相等
    // NSOrderedDescending  前面的大于后面的
    switch ([str1 compare:str2]) {
        case NSOrderedAscending:
            NSLog(@"str1 小于 str2");
            break;
        case NSOrderedSame:
            NSLog(@"str1 等于 str2");
            break;
        case NSOrderedDescending:
            NSLog(@"str1 大于 str2");
            break;
        default:
            break;
    }
    
    // 忽略大小写进行比较
    switch ([str1 caseInsensitiveCompare:str2]) {
        case NSOrderedAscending:
            NSLog(@"str1小于str2");
            break;
        case NSOrderedSame:
            NSLog(@"str1等于str2");
            break;
        case NSOrderedDescending:
            NSLog(@"str1大于str2");
            break;
            
        default:
            break;
    }
    
    return 0;
}
