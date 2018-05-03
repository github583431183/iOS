//
//  Iphone.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Iphone.h"

@implementation Iphone

/*
 self 关键字 在类方法中的应用
 注意点：
 1.类方法 中可以直接 调用 类方法
 2.类方法 中不可以直接调用 对象方法
 3.类方法 中不能访问 成员变量
 */
+ (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    if (status == kFlahlightStatusOpen) {
        // [Iphone openFlahlight];
        // 其实在'类方法'中调用类方法除了可以使用'类名'调用以外, \
            还可以使用'self关键字'来调用  （self == Iphone）
        [self openFlahlight];
    }else
    {
        // [Iphone closeFlahlight];
        [self closeFlahlight];
    }
    NSLog(@"拍照");
    
}

+ (void)openFlahlight
{
    NSLog(@"打开闪光灯");
}

+ (void)closeFlahlight
{
    NSLog(@"关闭闪光灯");
}

@end
