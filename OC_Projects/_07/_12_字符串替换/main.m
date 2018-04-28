//
//  main.m
//  _12_字符串替换
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 需求：将&符号替换为 /
    NSString *str = @"http:&&www.520it.com&img&lnj.gif";
    // OccurrencesOfString: 要替换谁    \
        withString: 用谁替换
    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"&" withString:@"/"];
    NSLog(@"newStr = %@",newStr);
    
    // 1.去掉空格
    // 2.将&替换为/
    NSString *str2 = @"   http:   &&www.   520it.com   &img&lnj.gif   ";
    NSString *newStr2 = [str2 stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"newStr2 = |%@|", newStr2);
    NSString *newStr22 = [newStr2 stringByReplacingOccurrencesOfString:@"&" withString:@"/"];
    NSLog(@"newStr22 = |%@|", newStr22);
    
    // 替换首尾
    NSString *str3 = @" HTTP://www.520it.com/img/LNJ.GIF ";
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    NSString *newStr3 = [str3 stringByTrimmingCharactersInSet:set];
    NSLog(@"newStr3 = |%@|", newStr3);

    NSString *str4 = @"HTTP://www.520it.com/img/LNJ.GIF";
    NSCharacterSet *set2 = [NSCharacterSet uppercaseLetterCharacterSet];
    NSString *newStr4 = [str4 stringByTrimmingCharactersInSet:set2];
    NSLog(@"newStr4 = |%@|", newStr4);
    
    return 0;
}
