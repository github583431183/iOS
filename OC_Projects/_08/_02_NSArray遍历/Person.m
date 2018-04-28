//
//  Person.m
//  _02_NSArray遍历
//
//  Created by 吴佳臻 on 2017/12/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)say
{
    NSLog(@"加油");
}

- (void)sayWithName:(NSString *)name
{
    NSLog(@"%@ 加油", name);
}
@end
