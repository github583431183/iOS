//
//  main.m
//  _02_野指针和空指针
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc]init];
        
        /*
         僵尸对象:
            只要一个对象被释放了，我们就称这个对象为 '僵尸对象'
         野指针:
            当一'指针'指向一个'僵尸对象' 我们就称这个指针为 '野指针'
            只要给一个 野指针 发送消息就会报错
         */
        
        [p release]; //0
        /*
         开启 野指针 调试
         Edit Scheme -> 勾选 zombie objects
         
         此处 对象被释放 再次 release 会报错
         
         *** -[Person release]: message sent to deallocated instance 0x1004034c0
         
         [p release];
         
         */
        
        
        /*
         空指针:
            为了避免给'野指针' 发送消息会报错
            一般情况下，
            当一个对象被释放后我们会将这个对象的指针
                设置为空指针
            因为在OC中给空指针发送消息是不会报错的
         */
        
        p=nil;
        
        [p release];
        [p release];
        [p release];
        [p release];
       
    
    }
    return 0;
}
