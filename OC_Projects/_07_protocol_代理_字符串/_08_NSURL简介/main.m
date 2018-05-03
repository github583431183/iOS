//
//  main.m
//  _08_NSURL简介
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 1. 文件读取
    /*
     1. 创建 URL
     协议头 + 主机地址 + 文件路径
     */
    NSString *file = @"file://192.168.199.199/User/wujiazhen/Desktop/note/str.txt";
    NSString *http = @"http://www.baidu.com";
    // 注意：  \
        如果加载的资源是本机上的资源，那么 URL 中的主机地址可以省略 \
        虽然主机地址可以省略，但需要注意，文件路径中的最前面的 / 不能省略，文件路径最前面的 / 代表跟路径
    NSString *file2 = @"file:///Users/wujiazhen/Desktop/note/str.txt";
    NSURL *url = [NSURL URLWithString:file2];
    
    NSString *file3 = @"file:///Users/wujiazhen/Desktop/str.txt";
    // 注意： \
        如果是通过 NSURL 的 fileURLWithPath:方法创建的 URL ， \
        那么系统会自动给我们传入的字符串添加协议头（file://）,  \
        所以字符串中不需要写 file://
    // 注意：  \
        开发中一般情况下，如果访问本机资源，创建 URL 的时候，建议使用 fileURLWithPath 方法创建  \
        因为 url 不支持中文，如果URL中包含中文，那么无法访问， \
        但是如果是通过 fileURLWithString 方法创建URL ,那么URL中包含中文也可以进行访问，   \
        系统内部会自动对 URL 中包含的中文进行处理
    NSURL *url2 = [NSURL fileURLWithPath:file3];
    
    NSString *path2 = @"file:///Users/wujiazhen/Desktop/未命名文件夹/str.txt";
    
    // 如果 URL 中包含中文，又不通过 fileURLWithPath 创建，    \
        那么久必须在创建 URL 之前先对字符串中的中文进行处理，进行百分号编码
    NSLog(@"处理前:%@", path2);
    path2 = [path2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"处理后:%@", path2);
    
    NSURL *path22 = [NSURL URLWithString:path2];
    NSLog(@"url = %@", path22);
    
    //2. 根据 URL 加载文件中的字符串
    NSString *fileStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"str = %@", fileStr);
    
    //3. 文件写入
    NSString *str = @"lng";
    NSString *path3 = @"/Users/wujiazhen/Desktop/note/abc.txt";
    NSURL *url3 = [NSURL fileURLWithPath:path3];
    [str writeToURL:url3 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //注意:如果多次往同一个文件中写入内容,那么后一次的会覆盖前一次的
    NSString *str2 = @"xxoo";
    [str2 writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
    return 0;
}
