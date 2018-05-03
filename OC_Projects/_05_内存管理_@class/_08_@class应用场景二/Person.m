//
//  Person.m
//  _08_@class应用场景二
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [_dog release];
    [super dealloc];
}
@end
