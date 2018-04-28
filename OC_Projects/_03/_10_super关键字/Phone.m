//
//  Phone.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (void)carameWithFlahlightStatus:(FlahlightStatus)status;
{
    NSLog(@"- carameWithFlahlightStatus");
}

+ (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    if (status == kFlahlightStatusOpen) {
        [self openFlahlight];
    }else
    {
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
