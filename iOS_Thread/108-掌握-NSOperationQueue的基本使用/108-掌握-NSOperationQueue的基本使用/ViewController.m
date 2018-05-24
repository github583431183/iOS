//
//  ViewController.m
//  108-掌握-NSOperationQueue的基本使用
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Operation.h"
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
#pragma mark Events
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self invocationOperationWithQueue];
//    [self blockOperationWithQueue];
    [self customWithQueue];
}

#pragma mark ----------------------
#pragma mark Methods
-(void)invocationOperationWithQueue
{
    //1.创建操作，封装任务
    /*
     第一个参数:目标对象 self
     第二个参数:调用方法的名称
     第三个参数:前面方法需要接受的参数 nil
     */
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download1) object:nil];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download2) object:nil];
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download3) object:nil];
    
    //2.创建队列
    /*
     GCD:
         串行类型:create & 主队列
         并发类型:create & 全局并发队列
     NSOperation:
         主队列:[[NSOperationQueue mainQueue] 和 GCD中的主队列一样，串行队列
         非主队列:[[NSOperationQueue alloc]init] 非常特殊，同时具备并发和串行的功能
         默认情况下，非主队列是并发队列
     */
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //3.添加操作到队列中
    [queue addOperation:op1]; //内部已经调用了[op1 start];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    /*
     -[ViewController download2]----<NSThread: 0x608000265300>{number = 3, name = (null)}
     -[ViewController download1]----<NSThread: 0x600000266ec0>{number = 4, name = (null)}
     -[ViewController download3]----<NSThread: 0x60800026ea40>{number = 5, name = (null)}
     */
}
-(void)download1
{
    NSLog(@"%s----%@",__func__,[NSThread currentThread]);
}

-(void)download2
{
    NSLog(@"%s----%@",__func__,[NSThread currentThread]);
}


-(void)download3
{
    NSLog(@"%s----%@",__func__,[NSThread currentThread]);
}

-(void)blockOperationWithQueue{
    //1.创建操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3----%@",[NSThread currentThread]);
    }];
    //2.追加任务
    [op2 addExecutionBlock:^{
        NSLog(@"4----%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        NSLog(@"5----%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        NSLog(@"6----%@",[NSThread currentThread]);
    }];
    
    //2.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //3.添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    //简便方法
    //1)创建操作,2)添加操作到队列中
    [queue addOperationWithBlock:^{
        NSLog(@"7----%@",[NSThread currentThread]);
    }];
    /*
     6----<NSThread: 0x608000266c80>{number = 9, name = (null)}
     7----<NSThread: 0x6040002754c0>{number = 6, name = (null)}
     3----<NSThread: 0x608000266540>{number = 4, name = (null)}
     2----<NSThread: 0x60000026e680>{number = 5, name = (null)}
     1----<NSThread: 0x604000274d80>{number = 3, name = (null)}
     4----<NSThread: 0x600000272b80>{number = 7, name = (null)}
     5----<NSThread: 0x600000272bc0>{number = 8, name = (null)}
     */
}

-(void)customWithQueue{
    //1.封装操作
    Operation *op1 = [[Operation alloc]init];
    Operation *op2 = [[Operation alloc]init];
    //2.创建对了
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //3.添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    /*
     main---<NSThread: 0x60c000269040>{number = 4, name = (null)}
     main---<NSThread: 0x60000027f2c0>{number = 3, name = (null)}
     */
}
@end
