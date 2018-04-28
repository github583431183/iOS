//
//  main.m
//  _12_类的本质
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

void demo(Class c);

void demo(Class c)
{
    id obj = [[c alloc] init];
    NSLog(@"demo:  %@", obj);
}

int main(int argc, const char * argv[]) {
    
    /*
     类的本质:
     类 其实 也是一个'对象', 
        这个'对象'会在这个 类 第一次 被使用的时候创建
     
     只要有了 '类对象', 将来就可以通过'类对象'来创建'实例对象'
     实例对象 中有一个'isa指针', 指向 创建自己的 类对象
     
     类 对象中保存了'当前对象'所有的 对象方法
     
     当给一个'实例对象'发送消息的时候, 
        会根据'实例对象'中的'isa指针'去对应的类对象中查找
     */
    
    Person *p = [[Person alloc] init];
    [p setAge:30];
    
    [Person test];
    
    // 1.如何获取类对象  \
        [实例对象 class];  \
        [类名 class];
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    // 一个'类' 在 内存 中只有一份 类对象
    Class c1 = [p1 class];
    Class c2 = [p2 class];
    Class c3 = [Person class];
    // c1 = 0x100001338, c2 = 0x100001338, c3 = 0x100001338
    NSLog(@"c1 = %p, c2 = %p, c3 = %p", c1, c2, c3);
    
    // 2.类对象的应用场景 \
        2.1 用于创建实例对象
    Person *p3 = [[c1 alloc] init];
    p3.age = 30;
    NSLog(@"%i", p3.age);
    
    // 2.2用于调用类方法 \
        [Person test];
    [c1 test];
    
    demo(c1);
    demo([Car class]);
    return 0;
}


