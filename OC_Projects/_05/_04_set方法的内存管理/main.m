//
//  main.m
//  _04_set方法的内存管理
//
//  Created by 吴佳臻 on 2017/6/9.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Room.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //1.创建两个对象
        Person *p = [[Person alloc]init];
        Room *r = [[Room alloc]init];
        r.no = 888;
        
        //2.将 Room 对象 r 复制给 Person 对象
        p.room = r;
        
        //3.对 Room 对象 r  release
        [r release];
        
        //4.创建一个新的 Room 对象
        Room *r2 = [[Room alloc]init];
        r2.no = 999;
        
        //5.将新的 Room 对象 r2 复制给 Person 对象
        p.room = r2;
        
        //6.对Room 对象 r2  release
        [r2 release];
        
        //7.对 Person 对象 p  release  \
            此时 p  的引用计数器为0 ，对象释放
        [p release];
        
    }
    return 0;
}
