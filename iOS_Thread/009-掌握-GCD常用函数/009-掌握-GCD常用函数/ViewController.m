//
//  ViewController.m
//  009-掌握-GCD常用函数
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
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
    //[self delay];
    
    //    [self once];
    
    Person *p1 = [[Person alloc]init];
    Person *p2 = [[Person alloc]init];
    NSLog(@"p1:%@ --- p1.books:%@ --|-- p2:%@ --- p2.books:%@",p1,p1.books,p2,p2.books);
    
    /*
     //懒加载
     p1:<Person: 0x60800000b150> ---
     p1.books:(
     1234,
     56789
     )
     --|--
     p2:<Person: 0x60800000b260> ---
     p2.books:(
     1234,
     56789
     )
     //一次性代码
     p1:<Person: 0x600000010f90> ---
     p1.books:(
     1234,
     56789
     )
     --|--
     p2:<Person: 0x6000000110c0> ---
     p2.books:(null)
     */
}

-(void)delay{
    //延时执行
    NSLog(@"start----%@",[NSThread currentThread]);
    
    //1.延时执行的第一种方法
    //[self performSelector:@selector(task) withObject:nil afterDelay:2.0];
    /*
     start----<NSThread: 0x60000006fe40>{number = 1, name = main}
     task----<NSThread: 0x60000006fe40>{number = 1, name = main}
     */
    
    //2.延时执行的第二种方法
    //[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(task) userInfo:nil repeats:YES];
    /*
     start----<NSThread: 0x60000007f8c0>{number = 1, name = main}
     task----<NSThread: 0x60000007f8c0>{number = 1, name = main}
     task----<NSThread: 0x60000007f8c0>{number = 1, name = main}
     */
    
    //3.GCD
    //    dispatch_queue_t queue = dispatch_get_main_queue(); 不要延时主线程
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*
     第一个参数:DISPATCH_TIME_NOW 从现在开始计算时间
     第二个参数:延迟的时间 2.0 GCD时间单位:纳秒
     第三个参数:队列
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"GCD----%@",[NSThread currentThread]);
        /*
         start----<NSThread: 0x60800006c740>{number = 1, name = main}
         GCD----<NSThread: 0x60c000078a80>{number = 3, name = (null)}
         */
    });
}

-(void)task
{
    NSLog(@"task----%@",[NSThread currentThread]);
}


-(void)once{
    //一次性代码
    //不能放在懒加载中，应用场景:单例模式
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"---once----");
    });
}

@end
