//
//  ViewController.m
//  008-掌握-GCD线程间通信
//
//  Created by 吴佳臻 on 2018/5/24.
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //0.创建子线程下载图片
    //DISPATCH_QUEUE_PRIORITY_DEFAULT 0
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        //1.1确认url
        NSURL *url = [NSURL URLWithString:@"http://a.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=da0ec79c738da9774e7a8e2f8561d42f/c83d70cf3bc79f3d6842e09fbaa1cd11738b29f9.jpg"];
        //1.2下载二进制数据到本地
        NSData *imageData =  [NSData dataWithContentsOfURL:url];
        //1.3转换图片
        UIImage *image = [UIImage imageWithData:imageData];
        
        NSLog(@"download----%@",[NSThread currentThread]);
        //1.4更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            NSLog(@"UI----%@",[NSThread currentThread]);
            /*
             download----<NSThread: 0x60000007c4c0>{number = 3, name = (null)}
             end----<NSThread: 0x60000007c4c0>{number = 3, name = (null)}
             UI----<NSThread: 0x6080000730c0>{number = 1, name = main}
             */
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            NSLog(@"UI----%@",[NSThread currentThread]);
            /*
             download----<NSThread: 0x6040000799c0>{number = 3, name = (null)}
             UI----<NSThread: 0x60000006f000>{number = 1, name = main}
             end----<NSThread: 0x6040000799c0>{number = 3, name = (null)}
             */
        });
        
        NSLog(@"end----%@",[NSThread currentThread]);
    });
}


@end
