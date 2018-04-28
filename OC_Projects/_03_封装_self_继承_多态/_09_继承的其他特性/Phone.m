//
//  Phone.m
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (void)signalWithNumber:(NSString *)number
{
    NSLog(@"利用手机打电话给%@", number);
}

- (void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content
{
    NSLog(@"利用手机发短信给%@, 内容是%@", number, content);
}

+ (void)brand
{
    NSLog(@"品牌");
}

@end
