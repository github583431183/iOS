//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    if (self  = [super init]) {
        _age = 10;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %i", _age];
}
@end
