//
//  ViewController.m
//  004-了解-线程的状态
//
//  Created by 吴佳臻 on 2018/5/23.
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


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.创建线程，新建
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    //2.启动线程，就绪<--->运行
    [thread start];
}
-(void)task{
    for (NSInteger i = 0; i < 100; i++) {
        NSLog(@"%zd---%@",i,[NSThread currentThread]);
        if (i == 20) {
            // [NSThread exit];  //退出当前线程
            break;              //表示任务已经执行完毕.
        }
    }
}
-(void)run{
    NSLog(@"run----%@",[NSThread currentThread]);
    //阻塞线程
    //[NSThread sleepForTimeInterval:2.0];
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.0]];
    
    NSLog(@"end---");
}

@end
