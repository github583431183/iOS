//
//  Person.m
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    //    NSLog(@"Person dealloc");
    // 打印当前方法  -[Person dealloc]
    NSLog(@"%s", __func__);
    
    [super dealloc];
}
@end
