//
//  main.m
//  _10_字符串搜索
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    NSString *str = @"http://www.baidu.com";
    // 1. 判断开头 ，本质就是从字符串的第一个字符开始匹配，只要不匹配就返回 NO
    if([str hasPrefix:@"http://"]){
        NSLog(@"是一个URL");
    }else{
        NSLog(@"不是一个URL");
    }
    
    // 2. 判断结尾 , 本质就是从字符串的最后一个字符开始匹配，只要不匹配就返回 NO
    if([str hasSuffix:@".com"]){
        NSLog(@"yes");
    }else{
        NSLog(@"no");
    }
    
    // 3. 判断字符串中是否包含 baidu  \
        只要 str 中包含该字符串，那么就会返回该字符串在 str 中的起始位置以及该字符串的长度  \
        location 从 0 开始，length 从 1 开始   \
        如果 str 中没有需要查找的字符串，那么返回的 range 的length = 0,location = NSNotFound
    NSRange range = [str rangeOfString:@"baidu"];
    if(range.location == NSNotFound){
        NSLog(@"NSNotFound");
    }else{
        NSLog(@"Found");
    }
    if(range.length == 0){
        NSLog(@"str中没有需要查找的字符串");
    }else{
        NSLog(@"str中有需要查找的字符串");
        NSLog(@"location = %lu, length = %lu", range.location, range.length);
    }
    
    return 0;
}
