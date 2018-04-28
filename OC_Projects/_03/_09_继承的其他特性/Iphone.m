//
//  Iphone.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Iphone.h"

@implementation Iphone

- (void)setCpu:(int)cpu
{
    _cpu = cpu;
}

- (int)cpu
{
    return _cpu;
}


- (void)signalWithNumber:(NSString *)number
{
    NSLog(@"利用 iphone 打电话给 %@", number);
}

+ (void)brand
{
    NSLog(@"iPhone手机");
}


@end
