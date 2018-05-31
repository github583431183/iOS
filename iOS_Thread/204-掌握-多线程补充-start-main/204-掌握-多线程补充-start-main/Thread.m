//
//  Thread.m
//  204-掌握-多线程补充-start-main
//
//  Created by 吴佳臻 on 2018/5/31.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Thread.h"

@implementation Thread

-(void)main{
    [super main];
    NSLog(@"%@---main---",[NSThread currentThread]);
}
@end
