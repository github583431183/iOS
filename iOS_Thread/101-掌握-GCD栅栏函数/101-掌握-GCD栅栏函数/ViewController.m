//
//  ViewController.m
//  101-掌握-GCD栅栏函数
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //0.获取全局并发队列
    //栅栏函数不能使用全局并发队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    //1.异步函数
    //1.异步函数
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<5; i++) {
            NSLog(@"download1-%zd-%@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<5; i++) {
            NSLog(@"download2-%zd-%@",i,[NSThread currentThread]);
        }
    });
    
    //栅栏函数
    dispatch_barrier_async(queue, ^{
        NSLog(@"++++++++++++++栅栏函数+++++++++++++++");
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<5; i++) {
            NSLog(@"download3-%zd-%@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<5; i++) {
            NSLog(@"download4-%zd-%@",i,[NSThread currentThread]);
        }
    });
    
    /*
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    
    download2-0-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download1-0-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download2-1-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download1-1-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download1-2-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download2-2-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download1-3-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download2-3-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download1-4-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download2-4-<NSThread: 0x608000261080>{number = 4, name = (null)}
    ++++++++++++++栅栏函数+++++++++++++++
    download4-0-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download3-0-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download4-1-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download3-1-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download4-2-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download3-2-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download3-3-<NSThread: 0x608000261080>{number = 4, name = (null)}
    download4-3-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download4-4-<NSThread: 0x60c0000764c0>{number = 3, name = (null)}
    download3-4-<NSThread: 0x608000261080>{number = 4, name = (null)}
     
     
     
     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
     
     ++++++++++++++栅栏函数+++++++++++++++
     download2-0-<NSThread: 0x60c00006e340>{number = 4, name = (null)}
     download4-0-<NSThread: 0x608000074fc0>{number = 6, name = (null)}
     download3-0-<NSThread: 0x60c00006ea40>{number = 5, name = (null)}
     download1-0-<NSThread: 0x60c00006e280>{number = 3, name = (null)}
     download2-1-<NSThread: 0x60c00006e340>{number = 4, name = (null)}
     download3-1-<NSThread: 0x60c00006ea40>{number = 5, name = (null)}
     download4-1-<NSThread: 0x608000074fc0>{number = 6, name = (null)}
     download1-1-<NSThread: 0x60c00006e280>{number = 3, name = (null)}
     download2-2-<NSThread: 0x60c00006e340>{number = 4, name = (null)}
     download3-2-<NSThread: 0x60c00006ea40>{number = 5, name = (null)}
     download4-2-<NSThread: 0x608000074fc0>{number = 6, name = (null)}
     download1-2-<NSThread: 0x60c00006e280>{number = 3, name = (null)}
     download2-3-<NSThread: 0x60c00006e340>{number = 4, name = (null)}
     download3-3-<NSThread: 0x60c00006ea40>{number = 5, name = (null)}
     download4-3-<NSThread: 0x608000074fc0>{number = 6, name = (null)}
     download1-3-<NSThread: 0x60c00006e280>{number = 3, name = (null)}
     download2-4-<NSThread: 0x60c00006e340>{number = 4, name = (null)}
     download3-4-<NSThread: 0x60c00006ea40>{number = 5, name = (null)}
     download4-4-<NSThread: 0x608000074fc0>{number = 6, name = (null)}
     download1-4-<NSThread: 0x60c00006e280>{number = 3, name = (null)}

     */
}
@end
