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
 self 关键字
 
 1.如果self在'对象方法'中, 那么self就代表调用当前'对象方法'的那个'对象'
 2.如果self在'类方法'中, 那么self就代表调用当前'类方法'的那个'类'
 
 总结:
 我们只用关注self在哪一个方法中 , 
 如果在'类方法'那么就代表'当前类',
 如果在'对象方法'那么就代表'当前调用该方法的对象'
 
 
 注意:
 >self会'自动'区分'类方法'和'对象方法', 
    如果在'类方法'中使用self调用'对象方法', 那么会直接'报错'
 >不能在'对象方法'或者'类方法'中利用'self'调用当前'self'所在的方法
 
 使用场景:
 1.可以用于在'对象方法'之间进行相互调用
 2.可以用于在'类方法'之间进行相互调用
 3.可以用于区分'成员变量'和'局部变量'  '同名' 的情况
 */
+ (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    if (status == kFlahlightStatusOpen) {
        // NSLog(@"self = %p", self);
        [self openFlahlight]; // p
    }else
    {
        [self closeFlahlight];
    }
    NSLog(@"拍照");
}

+ (void)openFlahlight
{
    NSLog(@"打开闪光灯");
    //    NSLog(@"self = %p", self);
    // 死循环 当前方法会自动调用自己 出现递归调用
    [self openFlahlight]; // p
}

+ (void)closeFlahlight
{
    NSLog(@"关闭闪光灯");
}

- (void)setCpu:(int)cpu
{
    // 区分 成员变量 和 局部变量
    self->cpu = cpu;
}

@end
