//
//  Car.m
//  _07_@class应用场景一
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Car.h"
#import "Wheel.h"

@implementation Car

- (void)dealloc
{
    [_wheel release];
    [super dealloc];
}
@end
