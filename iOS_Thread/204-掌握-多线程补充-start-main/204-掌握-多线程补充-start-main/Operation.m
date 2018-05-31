//
//  Operation.m
//  204-掌握-多线程补充-start-main
//
//  Created by 吴佳臻 on 2018/5/31.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Operation.h"

@implementation Operation

-(void)start{
    NSLog(@"start---start");
    [super start];
     NSLog(@"start---end");
}
-(void)main{
    NSLog(@"main---start");
    [super main];
    NSLog(@"main---end");
}
@end
