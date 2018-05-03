//
//  main.m
//  _11_字符串截取
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str = @"<head>小码哥</head>";
    /*
     NSRange : 位置/长度
        1. NSRange range = {6, 3};
        2. NSRange range;
            range.location = 6;
            range.length = 3;
     */
    // 只要是 OC 提供的结构体，一般都是可以使用 NSMakeXXX 来创建
    // NSRange range = NSMakeRange(6, 3);
    
    //1. 动态获取截取的起始位置
    NSUInteger location = [str rangeOfString:@">"].location + 1;
    
    //2. 计算位置  \
        注意： \
            rangeOfString 是从左至右开始查找的，只要找不到就不找了
    NSUInteger lengthBS = [str rangeOfString:@"<" options:NSBackwardsSearch].location - location;
    NSLog(@"location = %lu, lengthBS = %lu", location, lengthBS);
    NSUInteger length = [str rangeOfString:@"</"].location - location;
    NSLog(@"location = %lu, length = %lu", location, length);
    
    //3. 截取字符串
    NSRange range = NSMakeRange(location, length);
    NSString *newStr = [str substringWithRange:range];
    NSLog(@"str = %@", str);
    NSLog(@"newStr = %@", newStr);
    
    NSString *temp = @"abcdefa";
    NSRange rangeTemp = [temp rangeOfString:@"a" options:NSBackwardsSearch];
    NSLog(@"%lu",rangeTemp.location);
    
    // 从什么地方开始截取，一直截取到最后
    NSString *newStr2 =    [str substringFromIndex:6];
    NSLog(@"newStr2 = %@", newStr2);
    
    /*
     <head>小码哥</head> --> 小码哥</head>  --> 小码哥
     <head>小码哥</head> --> <head>小码哥  --> 小码哥
     */
    NSLog(@"str = %@",str);
    NSUInteger location3 = [str rangeOfString:@">"].location+1;
    NSString *newStr3 = [str substringFromIndex:location3];
    NSLog(@"newStr3 = %@",newStr3);
    
    location = [newStr3 rangeOfString:@"</"].location;
    // 改变了指针的指向，并不是修改了原来的字符串
    newStr3 = [newStr3 substringToIndex:location];
    NSLog(@"newStr3 = %@",newStr3);
    
    return 0;
}
