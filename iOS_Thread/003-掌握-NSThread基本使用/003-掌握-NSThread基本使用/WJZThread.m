//
//  WJZThread.m
//  002-了解-pthread简单使用
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZThread.h"

@implementation WJZThread
-(void)dealloc
{
    NSLog(@"dealloc----%@",[NSThread currentThread]);
}
@end
