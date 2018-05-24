//
//  Operation.m
//  108-掌握-NSOperationQueue的基本使用
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Operation.h"

@implementation Operation

//告知要执行的任务是什么
//1.有利于代码隐藏
//2.复用
-(void)main{
    NSLog(@"main---%@",[NSThread currentThread]);
}
@end
