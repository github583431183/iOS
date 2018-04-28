//
//  Person.m
//  _05
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person



/**
 重写 dealloc 方法
 */
- (void)dealloc
{
    NSLog(@"Person dealloc");
    // 注意:  \
        [super dealloc] 一定要写到 所有代码 的最后  \
        一定要写在dealloc方法的最后面
    [super dealloc];
}

@end
