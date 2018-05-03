//
//  main.m
//  _14_SEL类型
//
//  Created by 吴佳臻 on 2017/6/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
int main(int argc, const char * argv[]) {
    
    /*
     SEL类型的作用：
     1.配合对象 ／ 类  来检查  对象 ／ 类 
        中有没有实现某一方法
     
        判断 p 对象 中有没有实现 - 号开头的 setAge: 方法
        如果 p 对象 实现了 setAge: 方法那么就会返回 YES
        如果 p 对象 没有实现 setAge: 方法那么就会返回 NO
     */
    
    SEL sel = @selector(setAge:);
    Person *p = [Person new];
    
    // respondsToSelector 方法注意点:  \
        如果是通过一个 对象 调用该方法那么会判断   \
            该对象有没有实现 - 号开头的方法  \
        如果是通过 类 来调用该方法，   \
            那么会判断该类有没有实现 + 号开头的方法
    BOOL flag = [p respondsToSelector:sel];
    NSLog(@"flag = %i",flag);
    
    SEL sel1 = @selector(test);
    flag = [p respondsToSelector:sel1];
    NSLog(@"flag = %i",flag);
    
    flag = [Person respondsToSelector:sel1];
    NSLog(@"flag = %i",flag);
    
    /*
     2. 配合 对象 ／ 类 调用某一个 SEL 方法
     */
    
    SEL sel3 = @selector(demo);
    Person *p2 = [Person new];
    
    // 调用 p对象 中 sel 类型对应的方法
    [p2 performSelector:sel3];
    
    SEL sel4 = @selector(signalWithNumber:);
    // withObject: 需要传递参数  \
        注意:   \
            如果通过 performSelector 调用有参数的方法   \
            那么参数必须是对象类型，   \
            也就是说方法的形参必须接受的是一个对象   \
            因为 withObject 只能传递一个对象
    [p2 performSelector:sel4 withObject:@"123123123"];
    
    SEL sel5 = @selector(setAge:);
    // 传递其他类型  @( )
    [p2 performSelector:sel5 withObject:@(1)]; //295
    NSLog(@"age = %i",p2.age);
    
    // 注意:   \
        performSelector 最多只能传递2个参数
    SEL sel6 = @selector(sendMessageWithNumber:andContent:);
    [p2 performSelector:sel6 withObject:@"123"
        withObject:@"abcd"];
    
    /*
     3. 配合对象将 SEL 类型 作为方法的形参
     */
    Car *c = [Car new];
    SEL sel7 = @selector(run);
    
    Person *p3 = [Person new];
    [p3 makeObject:c andSel:sel7];
    
    return 0;
}
