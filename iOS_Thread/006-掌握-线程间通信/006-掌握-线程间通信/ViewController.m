//
//  ViewController.m
//  006-掌握-线程间通信
//
//  Created by 吴佳臻 on 2018/5/23.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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

#pragma mark -------
#pragma Events

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
}
#pragma mark -------
#pragma mark Methods
//开子线程下载图片，回到主线程刷新UI
-(void)download{
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"];
    //2.根据url下载图片二进制数据到本地
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    //3.转换图片格式
    UIImage *image = [UIImage imageWithData:imageData];
    NSLog(@"download----%@",[NSThread currentThread]);
    //4.回到主线程显示UI
    /*
     第一个参数:回到主线程要调用哪个方法
     第二个参数:前面方法需要传递的参数 此处就是image
     第三个参数:是否等待
     */
    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
    
    [self performSelector:@selector(showImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
    //-[UIImageView setImage:] must be used from main thread only
    //self.imageView.image = image;
    NSLog(@"---end---");
}

//更新UI操作
-(void)showImage:(UIImage *)image
{
    self.imageView.image = image;
    NSLog(@"UI----%@",[NSThread currentThread]);
}

//计算代码段执行时间的第一种方法
-(void)download1{
    //0.000018
    //0.166099
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"];
    
    NSDate *start = [NSDate date];  //获得当前的时间
    
    //2.根据url下载图片二进制数据到本地
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    NSDate *end = [NSDate date];  //获得当前的时间
    
    NSLog(@"%f",[end timeIntervalSinceDate:start]);
    
    //3.转换图片格式
    UIImage *image = [UIImage imageWithData:imageData];
    
    //4.显示UI
    self.imageView.image = image;
}
//计算代码段执行时间的第二种方法
-(void)download2
{
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"];
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    
    //2.根据url下载图片二进制数据到本地
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"end-start = %f---%f---%f",end - start,end,start);
    
    //3.转换图片格式
    UIImage *image = [UIImage imageWithData:imageData];
    
    //4.显示UI
    self.imageView.image = image;
}
@end
