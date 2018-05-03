//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)test
{
    NSLog(@"test");
}

- (void)demo
{
    NSLog(@"demo");
}

- (void)signalWithNumber:(NSString *)number
{
    NSLog(@"number = %@", number);
}

- (void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content
{
    NSLog(@"number = %@, content = %@", number, content);
}

- (void)makeObject:(id)obj andSel:(SEL)sel
{
    [obj performSelector:sel];
}
@end
