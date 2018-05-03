//
//  main.m
//  _02_第一个OC类-方法
//
//  Created by 吴佳臻 on 2017/6/1.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>


// 1.编写类的声明
@interface Iphone : NSObject
{
    
@public
    float _model; // 型号  0
    int _cpu; // cup   0
    double _size; // 尺寸  0
    int _color; // 颜色  0
}

// 行为
/*
 OC中的'行为'和C语言中的'函数'一样, 都是用来保存一段特定功能的代码
 
 C语言中定义一个'函数', 分为 声明 和 实现, 声明写在.h中, 实现写在.c中
 OC中定义一个'方法', 也分为 声明 和 实现, 声明写在@interface中, 实现写在@implementation
 
 C语言的函数分为两种: 内部函数 和 外部函数
 OC中的方法也分为两种: 类方法 和 对象方法
 
 OC 中
 类方法 只能用 类名 调用, 对象方法 只能用 对象 调用
 OC中的 '类方法' 用 + 表示, OC中的 '对象方法' 用 - 表示
 
 编写C语言函数的规律: 1.确定函数名称 2.确定形参 3.确定返回值 4.确定返回值类型
 编写OC方法也有规律, 规律和C语言一模一样
 */


/*
 C语言函数
 void about();
 void about()
 {
    printf("model = cpu = size = color");
 }
 */

//// 注意: OC中的方法, 如果没有形参不需要写 () , 而是直接写一个 ;
//      为什么OC中没有形参不需要写()呢?
//      因为OC方法中的()有特殊的用途, OC方法中的()是用来 括住 数据类型的
- (void)about;
@end

// 2.编写类的实现
@implementation Iphone

// 行为的实现
- (void)about
{
    NSLog(@"打印本机信息");
}
@end

int main(int argc, const char * argv[]) {
    
    
    // 1.通过类创建对象
    Iphone *p = [Iphone new];
    
    // 2.修改对象的属性
    p->_size = 3.5;
    p->_color = 0;
    p->_model = 4;
    p->_cpu = 1;
    
    // 3.获取对象的属性
    NSLog(@"size = %f, color = %i, model = %f, cpu = %i",
          p->_size, p->_color, p->_model, p->_cpu);
    
    // 4.如果给对象发消息(如果调用对象的方法)
    [p about];
    
    
    return 0;
}
