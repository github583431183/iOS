//
//  Dog.m
//  _08_@class应用场景二
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Dog.h"
#import "Person.h"

@implementation Dog

-(void)dealloc
{
    [_owner release];
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end

