//
//  Dog.m
//  _18_Copy与Property
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (void)dealloc
{
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
