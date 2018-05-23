//
//  ViewController.m
//  001-了解-耗时操作
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "WJZThread.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self createNewThread1];
    //[self createNewThread2];
    [self createNewThread3];
}

//1.alloc init 创建线程，需要手动启动线程
//线程的生命周期:当任务执行完毕之后被释放掉
-(void)createNewThread1{
    
    //1.创建线程
    /*
     第一个参数:目标对象 self
     第二个参数:方法选择器 调用的方法
     第三个参数:前面调用方法需要传递的参数 nil
     */
    WJZThread *threadA = [[WJZThread alloc] initWithTarget:self selector:@selector(run:) object:@"ABC"];
    //设置属性
    threadA.name = @"线程A";
    //设置优先级 取值范围 0.0 ~ 1.0 之间 最高是1.0 默认优先级是0.5
    threadA.threadPriority = 1.0;
    //2.启动线程
    [threadA start];
    
    NSThread *threadB = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    threadB.name = @"线程b";
    threadB.threadPriority = 0.1;
    [threadB start];
    
    NSThread *threadC = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    threadC.name = @"线程C";
    [threadC start];
}

//2.分离线程，自动启动线程
-(void)createNewThread2{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"分离自线程"];
}

//3.开启一条后台线程
-(void)createNewThread3
{
    [self performSelectorInBackground:@selector(run:) withObject:@"开启后台线程"];
}

- (IBAction)btnClick:(id)sender {
    
}

-(void)run:(NSString *)param{
    NSLog(@"---run----name:%@ ---param:%@",[NSThread currentThread].name,param);
//    for (NSInteger i = 0; i<10000; i++) {
//        NSLog(@"%zd----%@",i,[NSThread currentThread].name);
//    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
