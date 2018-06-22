//
//  ViewController.m
//  306-掌握-中文转码
//
//  Created by 吴佳臻 on 2018/6/20.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self get];
    [self post];
}

-(void)get{
    NSString *urlStr = @"http://www.baidu.com/login?username=哈哈";
    //转码前: http://www.baidu.com/login?username=哈哈
    NSLog(@"转码前: %@",urlStr);
   
    //中文转码处理
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //转码后: http://www.baidu.com/login?username=%E5%93%88%E5%93%88
    NSLog(@"转码后: %@",urlStr);
    
    //1.url
    NSURL *url = [NSURL URLWithString:urlStr];
    //url------http://www.baidu.com/login?username=%E5%93%88%E5%93%88
    NSLog(@"url------%@",url);
    
    //2.url request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.connect
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //容错处理
        if (connectionError) {
            NSLog(@"%@",connectionError);
            return ;
        }
        //4.解析
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
}

-(void)post{
    NSString *urlStr = @"http://www.baidu.com/login";
    //1. url
    NSURL *url = [NSURL URLWithString:urlStr];
    //2. url request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //2.1 POST
    request.HTTPMethod = @"POST";
    //2.2 body
    request.HTTPBody = [@"username=哈哈" dataUsingEncoding:NSUTF8StringEncoding];
    //3.connect
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //容错处理
        if (connectionError) {
            NSLog(@"%@",connectionError);
            return ;
        }
        //4.解析
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
}

@end
