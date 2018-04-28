//
//  Student.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Student.h"

@implementation Student


- (instancetype)init
{
    if (self = [super init]) {
        // [self setAge:10];
        _no = 1;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %i , no = %i", [self age], _no];
}

@end
