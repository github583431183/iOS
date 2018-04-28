//
//  main.m
//  _02_NSString基本使用
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Iphone : NSObject
- (NSString *)loadMessage;
@end


@implementation Iphone

- (NSString *)loadMessage
{
    // return "老婆我们家我做主";
    // NSString
    // 只需要在C语言字符串前面加上@符号, \
        系统就会自动将C语言字符串转换为OC字符串
    return @"老婆我们家我做主";
}

@end

int main(int argc, const char * argv[]) {
    
    // C语言中的 字符串 不是 对象
    char *name1 = "hh";
    char name2[] = "gg";
    
    // OC中的 字符串 是一个 对象
    // 正是因为 OC中 的 字符串 是一个对象, \
        所以它就具备了很多功能
    NSString *str = @"jj";
    
    Iphone *p = [Iphone new];
    // 注意: 输出C语言的字符串使用 %s
    //      输出OC的字符串使用 %@
    //      %@ 就专门用于输出 '对象类型'
    //    NSLog(@"content = %s", [p loadMessage]);
    NSLog(@"content = %@", [p loadMessage]); // NSString 是对象 所以使用 %@
    
    // 1.如何创建OC字符串
    NSString *str1 = @"hh";
    
    printf("age = %i, height = %f\n", 30, 1.75);
    NSString *str2 = [NSString stringWithFormat:@"age = %i, height = %f\n",
                     30, 1.75];
    NSLog(@"str = %@", str2);
    
    // 2.如何计算字符串的长度
    // C语言中计算字符数组的长度
    char name[] = "hha"; // h h a \0
    
    // 包含\0
    size_t size = sizeof(name);
    printf("size = %lu\n", size);
    
    // 不包含\0
    size_t length = strlen(name);
    printf("length = %lu\n", length);
    
    // OC 中计算字符串的长度
    // 不包含\0的
    // 计算出来的是 个数, 而不是占用的 字节数
    NSString *str3 = @"哈哈";
    NSUInteger len = [str3 length];
    NSLog(@"len = %lu", len);
    
    return 0;
}
