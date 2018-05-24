//
//  ViewController.m
//  007-掌握-GCD的基本使用
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----------------------
#pragma Events
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self createQueue1];
    //[self asyncConcurrent2];
    //[self asyncSerial3];
    //[self syncConcurrent4];
    //[self syncSerial5];
    //[self asyncMain6];
    [self syncMain7];
    
}
#pragma mark ----------------------
#pragma Methods
-(void)createQueue1{
    //1.创建队列
    /*
     第一参数哦:C语言的字符串，标签
     第二个参数:队列的类型
     DISPATCH_QUEUE_CONCURRENT:并发
     DISPATCH_QUEUE_SERIAL:串行
     */
    //dispatch_queue_t queue = dispatch_queue_create(<#const char * _Nullable label#>, <#dispatch_queue_attr_t  _Nullable attr#>)
    dispatch_queue_t queue1 = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("download", DISPATCH_QUEUE_SERIAL);
    
    //2.获得全局并发队列
    /*
     第一个参数:优先级 DISPATCH_QUEUE_PRIORITY_DEFAULT
     第二个参数:Reserved for future use. 0
     */
    // dispatch_queue_t queue = dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)
    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //3.获取主队列
    dispatch_queue_t queue4 = dispatch_get_main_queue();
}

-(void)asyncConcurrent2{
    //异步函数+并发队列:会开线程，并 开多条线程，队列中的任务 并发执行
    
    //1.获得全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSLog(@"---start---");
    
    //3.1封装任务
    //3.2添加任务到队列中
    /*
     第一个参数:队列
     第二个参数:要执行的任务
     */
    dispatch_async(queue, ^{
        NSLog(@"download1--asyncConcurrent2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"download2--asyncConcurrent2--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3--asyncConcurrent2--%@",[NSThread currentThread]);
    });
    
    NSLog(@"---end----");
    
    /*
     ---start---
     ---end----
     download1--asyncConcurrent2--<NSThread: 0x604000279a40>{number = 3, name = (null)}
     download3--asyncConcurrent2--<NSThread: 0x60c00007f540>{number = 5, name = (null)}
     download2--asyncConcurrent2--<NSThread: 0x600000078840>{number = 4, name = (null)}
     */
}

-(void)asyncSerial3{
    //异步函数+串行队列:会开线程，并 只开一条线程，队列中的任务 串行执行
    
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_SERIAL);
    NSLog(@"---start---");
    //2.封装任务
    dispatch_async(queue, ^{
        NSLog(@"download1--asyncSerial3--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2--asyncSerial3--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3--asyncSerial3--%@",[NSThread currentThread]);
    });
    
    NSLog(@"---end---");
    
    /*
     ---start---
     ---end---
     download1--asyncSerial3--<NSThread: 0x604000266ec0>{number = 3, name = (null)}
     download2--asyncSerial3--<NSThread: 0x604000266ec0>{number = 3, name = (null)}
     download3--asyncSerial3--<NSThread: 0x604000266ec0>{number = 3, name = (null)}
     */
}

-(void)syncConcurrent4{
    //同步函数+并发队列:不会开线程，任务 串行执行
    
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"---start---");
    //2.封装任务
    dispatch_sync(queue, ^{
        NSLog(@"download1--syncConcurrent4--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2--syncConcurrent4--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3--syncConcurrent4--%@",[NSThread currentThread]);
    });
    
    NSLog(@"---end---");
    
    /*
     ---start---
     download1--syncConcurrent4--<NSThread: 0x600000077780>{number = 1, name = main}
     download2--syncConcurrent4--<NSThread: 0x600000077780>{number = 1, name = main}
     download3--syncConcurrent4--<NSThread: 0x600000077780>{number = 1, name = main}
     ---end---
     */
}

-(void)syncSerial5{
    //同步函数+串行队列:不会开线程，任务 串行执行
    
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_SERIAL);
    NSLog(@"---start---");
    //2.封装任务
    dispatch_sync(queue, ^{
        NSLog(@"download1--syncSerial5--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2--syncSerial5--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3--syncSerial5--%@",[NSThread currentThread]);
    });
    NSLog(@"---end---");
    /*
     ---start---
     download1--syncSerial5--<NSThread: 0x604000077340>{number = 1, name = main}
     download2--syncSerial5--<NSThread: 0x604000077340>{number = 1, name = main}
     download3--syncSerial5--<NSThread: 0x604000077340>{number = 1, name = main}
     ---end---
     */
}


-(void)asyncMain6
{
    //异步函数+主队列:不会开线程,所有任务 在主线程中执行
    
    //1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"start----");
    //2.异步函数
    dispatch_async(queue, ^{
        NSLog(@"download1--asyncMain6--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2--asyncMain6--%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3--asyncMain6--%@",[NSThread currentThread]);
    });
    NSLog(@"---end---");
    /*
     start----
     ---end---
     download1--asyncMain6--<NSThread: 0x60000006f040>{number = 1, name = main}
     download2--asyncMain6--<NSThread: 0x60000006f040>{number = 1, name = main}
     download3--asyncMain6--<NSThread: 0x60000006f040>{number = 1, name = main}
     */
}


-(void)syncMain7
{
    //同步函数+主队列:死锁
    //注意:如果该方法在子线程中执行,那么所有的任务在 主线程中执行,
    
    //1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"start----");
    //2.同步函数
    //同步函数:立刻马上执行,如果我没有执行完毕,那么后面的也别想执行
    //异步函数:如果我没有执行完毕,那么后面的也可以执行
    dispatch_sync(queue, ^{
        NSLog(@"download1--syncMain7--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2--syncMain7--%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3--syncMain7--%@",[NSThread currentThread]);
    });
    
    NSLog(@"end---");
    /*
     start----
     ## 死锁 ...
     */
}









@end
