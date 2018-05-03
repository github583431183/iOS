//
//  Car.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Car.h"

@implementation Car
+ (void)load
{
    NSLog(@"Car类被加载到内存了");
}
+ (void)initialize
{
    NSLog(@"Car initialize");
}
@end
