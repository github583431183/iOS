//
//  ViewController.m
//  001-了解-耗时操作
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //1.获得主线程
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"%@",mainThread);
    //2.获得当前县城
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"%@",currentThread);
    //3.判断住县城
    //3.1 number == 1
    //3.2 类方法
    BOOL isMainThreadA = [NSThread isMainThread];
    //3.3 对象方法
    BOOL isMainThreadB = [currentThread isMainThread];
    NSLog(@"%zd --- %zd",isMainThreadA,isMainThreadB);
}

- (IBAction)btnClick:(id)sender {
    NSLog(@"%@",[NSThread currentThread]);
    
    
    //1.创建线程对象
    pthread_t thread;
    //2.创建线程
    /**
     第一个参数:线程对象 传递地址
     第二个参数:线程的属性 NULL
     第三个参数:指向函数的指针
     第四个参数:函数需要接受的参数
     */
//    pthread_create(
//                   pthread_t  _Nullable *restrict _Nonnull,
//                   const pthread_attr_t *restrict _Nullable,
//                   void * _Nullable (* _Nonnull)(void * _Nullable),
//                   void *restrict _Nullable
//                   )；
    pthread_create(
                   &thread,
                   NULL,
                   task,
                   NULL
                   );
    //1.创建线程对象
    pthread_t threadB;
    //2.创建线程
    /*
     第一个参数:线程对象 传递地址
     第二个参数:线程的属性 NULL
     第三个参数:指向函数的指针
     第四个参数:函数需要接受的参数
     */
    //pthread_create(&threadB, NULL, task, NULL);
    
    //pthread_equal(<#pthread_t#>, <#pthread_t#>)
}

void *task(void *param){
    NSLog(@"--- %@",[NSThread currentThread]);
    //耗时操作
    for (NSInteger i = 0; i < 100000; i++) {
        NSLog(@"%zd --- %@",i,[NSThread currentThread]);
    }
    return NULL;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
