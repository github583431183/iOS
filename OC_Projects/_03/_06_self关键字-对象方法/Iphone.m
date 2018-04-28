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
 self 关键字在对象方法中的应用
 注意点：
 1.如果'self'在'对象方法'中, 那么'self'就代表调用当前'对象方法'的那个 '对象'
 2.如果'self'在类方法中, 那么'self'就代表调用当前'类方法'的那个 '类'
 
 总结:
 我们只用关注self在哪一个方法中 , 
 如果在'类方法'那么就代表'当前类',
 如果在'对象方法'那么就代表'当前调用该方法的对象'
 */
- (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    if (status == kFlahlightStatusOpen) {
        // 其实self不仅仅可以调用'类方法', 还可以调用'对象方法'
        // self == 对象 == p == 0x100403420
        NSLog(@"self = %p", self);
        [self openFlahlight];
    }else
    {
        [self closeFlahlight];
    }
    NSLog(@"拍照");
}

- (void)openFlahlight
{
    NSLog(@"打开闪光灯");
}

- (void)closeFlahlight
{
    NSLog(@"关闭闪光灯");
}
@end
