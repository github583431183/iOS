//
//  Operation.m
//  109-掌握-NSOperationQueue其它用法
//
//  Created by 吴佳臻 on 2018/5/25.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "Operation.h"

@implementation Operation
-(void)main{
    //3个耗时操作
    for (NSInteger i = 0; i<10000;i++ ) {
        NSLog(@"download1---%zd--%@",i,[NSThread currentThread]);
    }
    
    //苹果官方的建议:每执行完一小段耗时操作的时候判断当前操作时候被取消
    if(self.isCancelled) return;
    
    NSLog(@"+++++++++++++++");
    
    for (NSInteger i = 0; i<10000;i++ ) {
        NSLog(@"download2---%zd--%@",i,[NSThread currentThread]);
    }
    
    if(self.isCancelled) return;
    
    NSLog(@"+++++++++++++++");
    
    for (NSInteger i = 0; i<1000;i++ ) {
        NSLog(@"download3---%zd--%@",i,[NSThread currentThread]);
    }

}
@end
