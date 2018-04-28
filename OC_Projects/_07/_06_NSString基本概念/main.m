//
//  main.m
//  _06_NSString基本概念
//
//  Created by 吴佳臻 on 2017/12/5.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    /*
    如何创建字符串对象
    通过不同的方式创建字符串，字符串对象存储的位置也不一样
        1. 如果是通过字符串常量创建，那么字符串对象存储位置在常量区
        2. 如果是通过
            alloc initWithFormat
            stringWithFormat创建，那么字符串对象存储在堆区中
    需要注意：
        1. 不同平台存储的方式也不一样，如果是Mac平台系统会自动对字符串对象进行优化，
            但如果是 iOS 平台就是两个对象
        2. 不同的编译器存储的方式也不一样，如果是Xcode 6 以下并且是iOS平台，
            那么每次 alloc 都会创建一个新的对象，
            但如果是在 Xcode 6 以上那么alloc多次指向同一块存储空间
     */
    
    //1. 通过字符串常量创建
    //注意： \
        如果通过字符串常量创建对象，并且字符串常量的内容一致， \
        那么如果创建多个字符串，多个对象指向同一块存储空间
    NSString *str1 = @"lnj";
    NSString *str11 = @"lnj";
    NSLog(@"str1 = %p,str11 = %p",str1,str11);
    
    //2. 通过 alloc init 创建 \
        只要调用 alloc 就会在堆内存中开辟一块存储空间
    NSString *str2 = [[NSString alloc]initWithFormat:@"lmj"];
    NSString *str22 = [[NSString alloc]initWithFormat:@"lmj"];
    NSLog(@"str2 = %p,str22 = %p",str2,str22);
    
    //3.通过类工厂方法创建   \
        内部其实就是封装了 alloc init
    NSString *str3 = [NSString stringWithFormat:@"zs"];
    NSString *str33 = [NSString stringWithFormat:@"zs"];
    NSLog(@"str3 = %p,str33 = %p",str3,str33);
    
    /*
     注意：
        一般情况下，只要是通过 alloc 或者 类工厂 创建的对象，
            每次都会在堆内存中开辟一块新的存储空间
        但是如果是通过 alloc 的 initWithString 方法除外，
            因为这个方法是通过 copy 返回一个字符串对象给我们
        而copy又分为深拷贝和浅拷贝，
            1. 深拷贝：
                如果是深拷贝 会 创建一个新的对象
            2. 浅拷贝
                如果是浅拷贝 不会 创建一个新的对象，
                而是直接返回被拷贝的对象的地址给我们
     */
    /*
     _06_NSString基本概念[1264:78377] str4 = 0x736c25, str44 = 0x736c25
     浅拷贝
     */
    NSString *str4 = [[NSString alloc]initWithFormat:@"ls"];
    NSString *str44 = [[NSString alloc]initWithFormat:@"ls"];
    NSLog(@"str4 = %p, str44 = %p", str4, str44);
    return 0;
}
