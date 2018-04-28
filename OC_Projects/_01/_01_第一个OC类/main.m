//
//  main.m
//  _01_第一个OC类
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 事物名称: iPhone
 属性: 颜色, 型号, cpu, 尺寸   -> 成员变量
 行为:打电话, 发短信, 上网      -> 成员方法
 
 C语言 中函数分为声明和实现
 OC 中定义一个类也分为声明和实现, 
   也就是说以后我们在OC中定义类, 就是在写类的声明和实现
 */

//// 1.如何编写类的声明

// 以@interface开头 ,
//  以@end结尾,
//  然后再class name对应的地方写上 事物名称, 也就是类名即可

//// 注意: 类名的首字符必须大写

// 声明一个类的目的就是为了告诉系统, 我们这个 类 中有哪些 属性 和 行为

//// 注意: 编写OC类 '属性' 的时, 建议将所有属性的名称前面都加上 _

// 类名后面的 :NSObject 是为了让我们的Iphone类具备 创建对象的能力
@interface Iphone: NSObject
{// OC类声明中 '属性' 只能在写 @interface 和 @end 之间的 {} 中
    
//// 注意: 默认情况下,OC对象中的 属性 是不能直接访问的

// 只要让类中的属性公开, 以后就可以直接通过一个指向'结构体'的指针来操作对象中的属性
@public
float _model; // 型号 0
int _cpu;// cpu 0
double _size;// 尺寸 0
int _color;// 颜色 0
}

// 行为

@end


//// 2.如何编写类的实现

// 以@implementation开头,
//  以@end结尾,
//  然后在 class 对应的地方写上声明时声明的类的名称,
//  必须和声明的类名一模一样
@implementation Iphone
// 行为的实现

@end

int main(int argc, const char * argv[]) {

//// 3. 如何通过一个类来创建对象
    
    // 在OC中想要通过一个 类 来创建一个对象, 必须给类'发送'一个消息(好比C语言中调用函数一样)
    // 如何发送消息?
    // 在OC中只要想 要发送消息就先写上 [类名称/对象名称 方法名称];
    // 发送什么消息(调用什么方法)可以创建一个对象呢? new
    
    Iphone *p = [Iphone new];
    // 通过一个 Iphone类型 的指针接收了 Iphone对象 的地址
    // 如果给一个 指针 保存了某一个对象的 地址 ,
    //   那么我们就称这个 指针位置 为 某个类型的对象
    // 利用Iphone类型的指针保存了Iphone对象的地址,
    //   那么我们就称Iphone类型的 指针p 为 Iphone对象
    
    /*
     只要通过一个类调用类的new方法, 
        也就是给类'发送'一个叫做new的消息之后
     系统内部就会做3件事情
     1. 为 Iphone类 对象分配存储空间
     2. 初始化Iphone类创建出来的对象中的属性
     3. 返回Iphone类创建出来的对象对应的地址
         // 什么是用于保存地址的? 指针
     */
    
    p->_size = 3.5;
    p->_color = 0;
    p->_model = 4;
    p->_cpu = 1;
    
    // OC中的类其实 '本质' 就是一个结构体,
    //  所以 p这个指针 其实就是指向了一个结构体
    NSLog(@"size = %f, color = %i, model = %f, cpu = %i",
          p->_size, p->_color, p->_model, p->_cpu);
    
// OC 类的本质  -> 结构体
    
    // 创建结构体
    struct Person
    {
        int age;
        char *name;
    };
    struct Person sp;
    
    // 创建结构体指针 赋值结构体指针变量
    struct Person *sip = &sp;
    
    // 赋值
    (*sip).age = 30;
    (*sip).name = "hh";
    
    sip->age = 30;
    sip->name = "hh";
    
    printf("age = %i, name = %s\n", sip->age,  sip->name );
    
    return 0;
}
