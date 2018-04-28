//
//  main.m
//  _01_内存管理_MRC
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


/*
 
 内存管理:
 
 1. ARC: Automatic(自动) Reference(引用) Counting(计数)
    自动引用计数:
        不需要程序员管理内容, '编译器'会在适当的地方'自动'给我们添加
            release / retain 等代码
    注意点: OC 中的 ARC 和 java 中的 垃圾回收机制 不太一样, 
        区别: 
            java 中的'垃圾回收'是'系统'干得,
            OC 中的'ARC'是'编译器'干得
 
 2. MRC: Manul(手动) Reference(引用) Counting(计数)
    手动引用计数:
        所有'对象的内容'都需要我们 手动管理 , 需要程序员自己编写
            release / retain 等代码

 3. 内存管理的'原则'就是
        有加就有减
        一次 alloc 对应一次 release, 
        一次 retain 对应一次 relese

 */
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // 只要创建一个对象  \
            默认引用计数器的值就是 1
        
        Person *p = [[Person alloc]init];
        NSLog(@"retainCount = %lu",[p retainCount]); //1
        
        // 只要给对象发送一个retain消息   \
            对象的引用计数器就会  +1
        [p retain];
        NSLog(@"retainCount = %lu",[p retainCount]); //2
        
        // 通过指针变量p,给p指向的对象发送一条 release 消息  \
            只要对象接收到 release 消息，引用计数器 就会 -1  \
            只要一个对象的 引用计数器 为0，系统就会释放对象
        
        [p release];
        
        // 注意:    \
            release 并步代表 销毁 \ 回收对象 , 仅仅是计数器 -1
        
        NSLog(@"retainCount = %lu",[p retainCount]);  //1
        
        [p release]; // 0
        NSLog(@"--------");
        
        
         [p setAge:20];
         NSLog(@"age = %i",[p age]);
     /*
      
            此时 Person对象的 引用计数器 已经为 0
            
            p 指针 已经是 野指针
            当开启 zombie objects（僵尸对象）
            会报错
         
            *** -[Person setAge:]: message sent to deallocated instance 0x100202870
         */

    }
    
    return 0;
}
