//
//  ViewController.m
//  109-掌握-NSOperationQueue其它用法
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Operation.h"
@interface ViewController ()
/** 队列 */
@property (nonatomic, strong) NSOperationQueue *queue;
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
#pragma mark Events
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self test];
    //[self test2];
}

- (IBAction)startBtnClick:(id)sender {
    //1.创建队列
    //默认是并发队列
    self.queue = [[NSOperationQueue alloc]init];
    
    //2.设置最大并发数量 maxConcurrentOperationCount
    self.queue.maxConcurrentOperationCount = 1;
    
    Operation *op1 = [[Operation alloc]init];
    
    Operation *op2 = [[Operation alloc]init];
    //4.添加到队列
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
}

- (IBAction)suspendBtnClick:(id)sender {
    //暂停,是可以恢复
    /*
     队列中的任务也是有状态的:已经执行完毕的 | 正在执行 | 排队等待状态
     */
    // 不能 暂停当前正在处于执行状态的任务，在op1执行时暂停，op2将不执行
    [self.queue setSuspended:YES];
}

- (IBAction)goOnBtnClick:(id)sender {
    //继续执行
    [self.queue setSuspended:NO];//在op1执行时暂停，op2将不执行,继续执行，将在执行op2
}

- (IBAction)cancelBtnClick:(id)sender {
    //取消,不可以恢复
    //该方法内部调用了所有操作的cancel方法
    [self.queue cancelAllOperations];
}

-(void)test{
    //1.创建队列
    //默认是并发队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //2.设置最大并发数量 maxConcurrentOperationCount
    //同一时间最多有多少个任务可以执行
    //串行执行任务!=只开一条线程(线程同步)
    // maxConcurrentOperationCount > 1   并发队列
    // maxConcurrentOperationCount == 1  串行队列
    // maxConcurrentOperationCount == 0  不会执行任务
    // maxConcurrentOperationCount == -1 特殊意义 最大值 表示不受限制
    queue.maxConcurrentOperationCount = 1; //串行队列
    //3.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1----%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2----%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4----%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"5----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op6 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"6----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op7 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"7----%@",[NSThread currentThread]);
    }];
    //4.添加到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
    [queue addOperation:op5];
    [queue addOperation:op6];
    [queue addOperation:op7];
    /*
     1----<NSThread: 0x608000272a40>{number = 3, name = (null)}
     2----<NSThread: 0x60800026ae40>{number = 4, name = (null)}
     3----<NSThread: 0x608000272a40>{number = 3, name = (null)}
     4----<NSThread: 0x60800026ae40>{number = 4, name = (null)}
     5----<NSThread: 0x60800026ae40>{number = 4, name = (null)}
     6----<NSThread: 0x608000272a40>{number = 3, name = (null)}
     7----<NSThread: 0x60800026ae40>{number = 4, name = (null)}
     */
}

-(void)test2{
    //1.创建队列
    //默认是并发队列
    self.queue = [[NSOperationQueue alloc] init];
    //2.设置最大并发数量 maxConcurrentOperationCount
    //同一时间最多有多少个任务可以执行
    //串行执行任务!=只开一条线程 (线程同步)
    // maxConcurrentOperationCount >1 那么就是并发队列
    // maxConcurrentOperationCount == 1 那就是串行队列
    // maxConcurrentOperationCount == 0  不会执行任务
    // maxConcurrentOperationCount == -1 特殊意义 最大值 表示不受限制
    self.queue.maxConcurrentOperationCount = 1;
    
    //3.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i<1000; i++) {
            NSLog(@"1-%zd---%@",i,[NSThread currentThread]);
        }
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i<1000; i++) {
            NSLog(@"2-%zd---%@",i,[NSThread currentThread]);
        }
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i<1000; i++) {
            NSLog(@"3-%zd---%@",i,[NSThread currentThread]);
        }
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4----%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i<1000; i++) {
            NSLog(@"5-%zd---%@",i,[NSThread currentThread]);
        }
    }];
    NSBlockOperation *op6 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"6----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op7 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"7----%@",[NSThread currentThread]);
    }];
    
    //4.添加到队列
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
    [self.queue addOperation:op3];
    [self.queue addOperation:op4];
    [self.queue addOperation:op5];
    [self.queue addOperation:op6];
    [self.queue addOperation:op7];
}

@end
