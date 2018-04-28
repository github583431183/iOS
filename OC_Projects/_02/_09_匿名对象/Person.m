//
//  Person.m
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)say
{
    NSLog(@"name = %@, age = %i", _name, _age);
}

- (void)signal:(Iphone *)phone
{
    [phone callWithNumber:12345678];
}

@end
