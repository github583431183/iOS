//
//  ViewController.m
//  102-掌握-GCD的快速迭代
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
//    [self forDemo];
//    [self applyDemo];
//    [self moveFile];
    [self moveFileWithGCD];
}

-(void)forDemo{
    //同步迭代
    for (NSInteger i = 0; i<10; i++) {
        NSLog(@"%zd---%@",i,[NSThread currentThread]);
    }
}

-(void)applyDemo{
    //开子线程和主线程一起完成遍历任务，任务的执行是并发的
    
    /*
     第一个参数:遍历的次数
     第二个参数:队列(并发队列)
     第三个参数:index 索引
     */
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%zd---%@",index,[NSThread currentThread]);
    });
    
    /*
     
     2---<NSThread: 0x60c0000709c0>{number = 5, name = (null)}
     3---<NSThread: 0x60c000076400>{number = 6, name = (null)}
     4---<NSThread: 0x60400006e900>{number = 1, name = main}
     6---<NSThread: 0x60800007ff80>{number = 8, name = (null)}
     5---<NSThread: 0x60400026bf80>{number = 7, name = (null)}
     0---<NSThread: 0x600000263f40>{number = 3, name = (null)}
     1---<NSThread: 0x60400026df40>{number = 4, name = (null)}
     7---<NSThread: 0x600000264040>{number = 9, name = (null)}
     8---<NSThread: 0x60800007ff80>{number = 8, name = (null)}
     9---<NSThread: 0x60400026bf80>{number = 7, name = (null)}
    
     */
}

-(void)moveFile{
    //使用for循环
    //1.拿到文件路径
    NSString *from = @"/Users/wjz/Desktop/from";
    
    //2.获得目标文件路径
    NSString *to = @"/Users/wjz/Desktop/to";
    
    //3.得到目录下面的所有文件
    NSArray *subPaths = [[NSFileManager defaultManager] subpathsAtPath:from];
    
    NSLog(@"%@",subPaths);
    //4.遍历所有文件,然后执行剪切操作
    NSInteger count = subPaths.count;
    
    for (NSInteger i = 0; i< count; i++) {
        
        //4.1 拼接文件的全路径
        // NSString *fullPath = [from stringByAppendingString:subPaths[i]];
        //在拼接的时候会自动添加/
        NSString *fullPath = [from stringByAppendingPathComponent:subPaths[i]];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPaths[i]];
        
        NSLog(@"%@",fullPath);
        //4.2 执行剪切操作
        /*
         第一个参数:要剪切的文件在哪里
         第二个参数:文件应该被存到哪个位置
         */
        [[NSFileManager defaultManager]moveItemAtPath:fullPath toPath:toFullPath error:nil];
        
        NSLog(@"%@---%@--%@",fullPath,toFullPath,[NSThread currentThread]);
    }
}

-(void)moveFileWithGCD{
    //1.拿到文件路径
    NSString *from = @"/Users/wjz/Desktop/from";
    
    //2.获得目标文件路径
    NSString *to = @"/Users/wjz/Desktop/to";
    
    //3.得到目录下面的所有文件
    NSArray *subPaths = [[NSFileManager defaultManager] subpathsAtPath:from];
    
    NSLog(@"%@",subPaths);
    //4.遍历所有文件,然后执行剪切操作
    NSInteger count = subPaths.count;
    
    dispatch_apply(count, dispatch_get_global_queue(0, 0), ^(size_t i) {
        //4.1 拼接文件的全路径
        // NSString *fullPath = [from stringByAppendingString:subPaths[i]];
        //在拼接的时候会自动添加/
        NSString *fullPath = [from stringByAppendingPathComponent:subPaths[i]];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPaths[i]];
        
        NSLog(@"%@",fullPath);
        //4.2 执行剪切操作
        /*
         第一个参数:要剪切的文件在哪里
         第二个参数:文件应该被存到哪个位置
         */
        [[NSFileManager defaultManager]moveItemAtPath:fullPath toPath:toFullPath error:nil];
        
        NSLog(@"%@---%@--%@",fullPath,toFullPath,[NSThread currentThread]);
        
    });
}
@end
