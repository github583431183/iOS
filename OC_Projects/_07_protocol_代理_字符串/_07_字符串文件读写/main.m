//
//  main.m
//  _07_字符串文件读写
//
//  Created by 吴佳臻 on 2017/12/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    /*
     file:文件路径
     encoding:编码应为 iOS-5988-1 中文 GBK,GB2312,一般情况填写UTF-8
     error:如果读取错误，会将错误信息保存到error中，如果读取正确，就没有error = nil
     注意:以后在OC方法中但凡看到 XXXofFile的方法，传递的一定是全路径（绝对路径）
     */
    
    NSString *path = @"/Users/wujiazhen/Desktop/note/main.txt";
    NSError *error = nil;
    
    // 1. 从文件中读取字符串
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if(error == nil){
        NSLog(@"str = %@",str);
    }else{
        NSLog(@"error = %@",[error localizedDescription]);
    }
    
    // 2. 将字符串写入文件中
    NSString *str2 = @"str";
    // automiclly 参数:    \
        yes , 字符串写入文件的过程中如果没有写完，那么不会生成新文件   \
        no , 字符串写入文件的过程中如果没有写完，会生成文件
    NSString *path2 = @"/Users/wujiazhen/Desktop/note/in.txt";
    BOOL flag = [str2 writeToFile:path2 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"flag = %i",flag);
    
    return 0;
}
