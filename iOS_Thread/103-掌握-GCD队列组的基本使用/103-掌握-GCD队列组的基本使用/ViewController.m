//
//  ViewController.m
//  103-掌握-GCD队列组的基本使用
//
//  Created by 吴佳臻 on 2018/5/24.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 图片1 */
@property (nonatomic, strong) UIImage *image1;
/** 图2 */
@property (nonatomic, strong) UIImage *image2;
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //[self group1];
    //[self group2];
    [self group3];
//    [self test];
}
#pragma mark ----------------------
#pragma mark Methods
-(void)group1{
    NSLog(@"----start----");

    //1.创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    //2.创建队列组
    dispatch_group_t group = dispatch_group_create();
    //3.异步函数
    /*
     1.封装任务
     2.把任务添加到队列中
     */
//    dispatch_async(queue, ^{
//        NSLog(@"1----%@",[NSThread currentThread]);
//    });
    
    /*
     1.封装任务
     2.把任务添加到队列中
     3.会监听任务的执行情况，通知group
     */
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"1----%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"2----%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"3----%@",[NSThread currentThread]);
    });
    
    
    //拦截通知,当队列组中所有的任务都 执行完毕 的时候回进入到下面的方法
    dispatch_group_notify(group, queue, ^{
        
        NSLog(@"-------dispatch_group_notify-------");
    });
    
    NSLog(@"----end----");

    /*
     
     ----start----
     ----end----
     1----<NSThread: 0x608000076bc0>{number = 3, name = (null)}
     2----<NSThread: 0x6080000773c0>{number = 4, name = (null)}
     3----<NSThread: 0x608000077280>{number = 5, name = (null)}
     -------dispatch_group_notify-------
     
     */
    
    
}

-(void)group2{
    
    //1.创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    //2.创建队列组
    dispatch_group_t group = dispatch_group_create();
    //3.在该方法后面的异步任务会被纳入到队列组的监听范围，
    // 进入群组 dispatch_group_enter|dispatch_group_leave 必须要配对使用
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        NSLog(@"1----%@",[NSThread currentThread]);
        
        //离开群组
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        NSLog(@"2----%@",[NSThread currentThread]);
        
        //离开群组
        dispatch_group_leave(group);
    });
    
    //拦截通知
    //问题?该方法是阻塞的吗?  内部本身是异步的
    dispatch_group_notify(group, queue, ^{
        NSLog(@"-------dispatch_group_notify-------");
    });

    //等待.死等. 直到队列组中所有的任务都执行完毕之后才能执行
    //阻塞的
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"----end----");
    
    /*
     2----<NSThread: 0x608000269c80>{number = 4, name = (null)}
     1----<NSThread: 0x60c000261680>{number = 3, name = (null)}
     ----end----
     -------dispatch_group_notify-------
     */
}

-(void)group3{
    /*
     1.下载图片1 开子线程
     2.下载图片2 开子线程
     3.合成图片并显示图片 开子线程
     */
    
    //-1.获取队列组
    dispatch_group_t group = dispatch_group_create();
    
    //0.获取并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //1.下载图片1 开子线程
    dispatch_group_async(group, queue, ^{
        NSLog(@"download1---%@",[NSThread currentThread]);
        //1.1 确定url
        NSURL *url = [NSURL URLWithString:@"http://www.qbaobei.com/tuku/images/13.jpg"];
        
        //1.2 下载二进制数据
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        //1.3 转换图片
        self.image1 = [UIImage imageWithData:imageData];
    });
    
    // 2.下载图片2 开子线程
    dispatch_group_async(group, queue,^{
        
        NSLog(@"download2---%@",[NSThread currentThread]);
        //2.1 确定url
        NSURL *url = [NSURL URLWithString:@"http://pic1a.nipic.com/2008-09-19/2008919134941443_2.jpg"];
        
        //2.2 下载二进制数据
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        //2.3 转换图片
        self.image2 = [UIImage imageWithData:imageData];
    });
    
    //3.合并图片
    //主线程中执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        NSLog(@"combie---%@",[NSThread currentThread]);
        //3.1 创建图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        
        //3.2 画图1
        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        self.image1 = nil;
        
        //3.3 画图2
        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        self.image2 = nil;
        
        //3.4 根据上下文得到一张图片
        UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
        
        //3.5 关闭上下文
        UIGraphicsEndImageContext();
        
        //3.6 更新UI
        //        dispatch_async(dispatch_get_main_queue(), ^{
        
        NSLog(@"UI----%@",[NSThread currentThread]);
        self.imageView.image = image;
        //        });
    });
    
    // 在 iOS 6.0 之前需要释放 （_create）
    //    dispatch_release(group)
}


-(void)test
{
    // dispatch_async(<#dispatch_queue_t queue#>, <#^(void)block#>)
    //区别:封装任务的方法(block--函数)
    /*
     第一个参数:队列
     第二个参数:参数
     第三个参数:要调用的函数的名称
     */
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, task);
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, task);
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, task);
    
}

void task(void *param)
{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
}

@end
