//
//  ViewController.m
//  401-掌握-JSON解析
//
//  Created by 吴佳臻 on 2018/6/21.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self jsonToOc];
    [self JSONWithOC];
    [self OCtoJSON];
    [self test];
}

-(void)jsonToOc{
    //1.确定url
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=123&pwd=456&type=JSON"];
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //data --> 本质上是一个json字符串
        //4.解析数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        //JSON --> oc对象 反序列化
        /*
         NSJSONReadingMutableContainers = (1UL << 0), 可变字典和数组
         NSJSONReadingMutableLeaves = (1UL << 1), 内部所有的字符串都是可变的 ios7之后又问题  一般不用
         NSJSONReadingAllowFragments = (1UL << 2) 既不是字典也不是数组,则必须使用该枚举值
         */
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSString *strM = @"\"haha\"";
        
        id obj = [NSJSONSerialization JSONObjectWithData:[strM dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@--%@",[obj class],obj);
        
    }];
}

// JSON --> OC
-(void)JSONWithOC{
    //NSString *strM = @"{\"error\":\"用户名不存在\"}";
    //NSString *strM = @"[\"error\",\"用户名不存在\"]";
    //NSString *strM = @"\"wendingding\"";
    //NSString *strM = @"false";
    //NSString *strM = @"true";
    NSString *strM = @"null";
    
    id obj = [NSJSONSerialization JSONObjectWithData:[strM dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:0];
    
    /*
     JSON OC
     {}   @{}
     []   @[]
     ""   @""
     false NSNumber 0
     true  NSNumber 1
     null  NSNull 空
     */
    
    //nil
    [NSNull null];//该方法获得的是一个单例，表示为空，可以用在字典或者数组中
}

//OC --> JSON
-(void)OCtoJSON{
    NSDictionary *dictM = @{
                            @"name":@"haha",
                            @"age":@3
                            };
    NSArray *arrayM = @[@"123",@"456"];
    //注意:并不是所有的OC对象都能转换成JSON
    /*
     - 最外层必须是 NSArray or NSDictionary
     - 所有的元素必须是 NSString NSNumber NSArray NSDictionary NSNull
     - 字典中所有的key都必须是 NSString类型的
     - NSNumber 不能是无穷大
     */
    NSString *strM = @"haha";
    //判断是否是 JSON 数据
    BOOL isValid = [NSJSONSerialization isValidJSONObject:strM];
    if (!isValid){
        NSLog(@"%d",isValid);
        return;
    }
    //OC --> JSON
    /*
     第一个参数:要转换的OC对象
     第二个参数:选项NSJSONWritingPrettyPrinted 排版 美观
     */
    NSData *data = [NSJSONSerialization dataWithJSONObject:strM options:NSJSONWritingPrettyPrinted error:nil];
    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}

-(void)test{
    NSArray *arrayM = [NSArray arrayWithContentsOfFile:@"app.plist"];
    NSLog(@"%@",arrayM);
    [arrayM writeToFile:@"123.json" atomically:YES];
    //OC --> JSON
    NSData *data = [NSJSONSerialization dataWithJSONObject:arrayM options:NSJSONWritingPrettyPrinted error:0];
    [data writeToFile:@"123.json" atomically:YES];
}

@end
