//
//  main.m
//  _13_重写description打印log
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    [p setAge:30];
    [p setName:@"haha"];
    [p setHeigth:1.75];
    [p setWeight:65];
    [p setTel:@"123123123123"];
    [p setEmail:@"haha@haha.com"];
    
    // %@ 是用来打印 对象 的, \
        其实 %@ 的本质是用于打印 字符串
    // 只要利用%@打印某个对象, 系统内部 默认 就会调用父类的description方法
    // 调用该方法, 该方法会返回一个字符串, \
        字符串的默认格式 <类的名称: 对象的地址>
    NSLog(@"age = %i, name = %@, height = %f, weight = %f, tel = %@, email = %@", [p age], [p name], [p height], [p weight], [p tel], [p email]);
    
    // class注意 c是小写, 只要给 类发送class消息, 就会返回 当前类 的类对象
    // 1.获取Person对应的类对象
    Class c = [Person class];
    // 2.打印Person的类对象
    NSLog(@"当前对象对应的类 = %@", c); // 当前对象对应的类 = Person

    NSLog(@"person = %@", p); // person = <Person: 0x1003045f0>

    NSLog(@"当前对象的地址 = %p", p); // 当前对象的地址 = 0x1003045f0
    
    return 0;
}
