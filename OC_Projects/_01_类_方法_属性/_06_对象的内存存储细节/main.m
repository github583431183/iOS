//
//  main.m
//  _06_对象的内存存储细节
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 要求定义一个人类
 事物的名称: 人(Person)
 属性: 年龄(age), 身高(height), 体重(weight)
 行为: 吃饭(eat), 睡觉(sleep), 散步(walk)
 */

@interface Person : NSObject
{
@public
    // 属性
    int _age;
    double _height;
    double _weight;
}
// 行为
- (void)eat:(char *)food;

- (void)sleep;

- (void)walk;

+ (void)demo;

@end

@implementation Person

- (void)eat:(char *)food
{
    NSLog(@"吃%s", food);
}

- (void)sleep
{
    NSLog(@"开始睡觉");
}

- (void)walk
{
    NSLog(@"开始遛弯");
}

+(void)demo
{
    NSLog(@"demo");
}

@end


int main(int argc, const char * argv[]) {

    // 1.通过类创建对象
    /*
     1.开辟存储空间, 通过 new方法 创建 对象会在 堆内存 中开辟 一块存储空间
     2.初始化所有属性
     3.返回指针地址
     
     4.创建对象的时候 返回的地址 其实就是 类的'第0个属性'的 地址
        但是需要注意的是: 类的 '第0个属性' 并不是我们编写的_age,
        而是一个叫做 isa 的属性
        isa 是一个指针, 占8个字节
     
     5.其实 '类' 也是一个 对象, 也就意味着 Person也是一个对象
        平时我们所说的 创建对象 其实就是通过一个 类对象 来创建一个 新的对象
        类对象 是 '系统 自动' 帮我们创建的, 里面保存了 当前对象 的所有方法
        而 实例对象 是程序自己手动通过 new 来创建的, 
        而 实例对象 中有一个 'isa指针' 就指向了创建它的那个 类对象
     
     */
    
    Person *p = [Person new];
    p->_age = 30;
    p->_height = 1.75;
    p->_weight = 65.0;
    
    NSLog(@"age = %i , height = %f, weight = %f",
          p->_age, p->_height, p->_weight);

    // 验证： isa指针
    NSLog(@"p = %p", p); // p = 0x1004030d0
    NSLog(@"&age = %p", &(p->_age)); // &age = 0x1004030d8 相差8字节
    
    // 验证： 结构体 中的指针与第0位属性 地址
    struct Person
    {
        int age;
        char *name;
    };
    struct Person sp;
    NSLog(@"&sp = %p", &sp);// &sp = 0x7fff5fbff6e8
    NSLog(@"&age = %p", &sp.age);// &age = 0x7fff5fbff6e8 相同
    
    // 1.每次new都会创建一个新的对象, 分配一块新的存储空间
    // 2.如果修改 A对象的属性 不会影响到 B对象的属性
    // 一个类可以创建多个对象
    Person *p2 = [Person new];
    p2->_age = 50;
    p2->_height = 188;
    p2->_weight = 100;

    NSLog(@"age = %i , height = %f, weight = %f",
          p2->_age, p2->_height, p2->_weight);

    return 0;
}
