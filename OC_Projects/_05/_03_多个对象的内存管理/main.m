//
//  main.m
//  _03_多个对象的内存管理
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
        
        // 将Room 对象 赋值给Person对象中的_room
        p.room = r;
        
        // 对Room 的引用计数器 -1
        [r release];
        
        // 在这行代码之前，Person 对象没有被释放
        NSLog(@"-------------------");
        
        // 对Person 对象的引用计数器 -1  \
            此时 Person 对象的引用计数器 为0   \
            Person 对象被回收，Room 对象也必须被回收
        [p release];
        
        /*
         log
         -------------------
        -[Room dealloc] no = 888
        -[Person dealloc]
         
         */
    }
    return 0;
}
