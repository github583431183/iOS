//
//  main.m
//  _04_id类型
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    
    /*
     
     id是一个数据类型, 并且是一个'动态'数据类型
     既然是数据类型, 所以就可以用来:
     1.定义变量
     2.作为函数的参数
     3.作为函数的返回值
     
     默认 情况下所有的'数据类型'都是'静态数据类型'
     
     静态数据 类型的特点:
     1.在编译时就知道变量的类型,
     2.知道变量中有哪些属性和方法
     3.在编译的时候就可以访问这些属性和方法,
     4.并且如果是通过'静态数据类型'定义变量,
     访问了'不属于'静态数据类型的 属性 和 方法, 那么编译器就会报错
     
     动态数据类型的特点:
     1.在'编译时'编译器并不知道变量的真实类型,
     只有在'运行时'才知道它的真实类型
     2.并且如果通过'动态数据类型'定义变量,
     访问了'不属于'动态数据类型的属性和方法, 编译器不会报错
     
     万能指针
     id == NSObject *
     
     id和 NSObject * 的区别:
     1.NSObject * 是一个静态数据类型
     2.id 是一个动态数据类型
     
     动态数据类型与静态数据类型 区别：
     1.通过'静态数据类型'定义变量, 不能调用子类特有的方法
     2.通过'动态数据类型'定义变量, 可以调用子类特有的方法
     3.通过'动态数据类型'定义的变量, 可以调用私有方法
     
     弊端:
     由于'动态数据类型'可以调用任意方法,
     所以有可能调用到不属于自己的方法, 而编译时又不会报错, 所以可能导致运行时的错误
     
     应用场景: 多态,
     可以减少代码量, 避免调用子类特有的方法需要强制类型转换
     
     
     */
    
    id obj = [Person new];
    [obj sleep];
    [obj test];
    //[obj eat]; 子类特有方法
    
    id obj2 = [Student new];
    [obj2 eat];
    [obj2 test]; // 父类私有方法
    
    // 为了避免动态数据类型引发的运行时的错误,     \
        一般情况下如果使用动态数据类型定义一个变量, \
        在调用这个对象的方法之前会进行一次'判断',  \
        判断当前对象是否能够调用这个方法
    
    //    id obj3 = [Person new];
    id obj3 = [Student new];
    
    if ([obj3 isKindOfClass:[Student class]]) {
        // isKindOfClass : 判断指定的'对象'是否是某一个类, 或者是某一个类的子类
        [obj3 eat];
    }
    
    if ([obj3 isMemberOfClass:[Student class]]) {
        // isMemberOfClass : 判断指定的'对象'是否是当前指定的类的实例
        [obj3 eat];
    }
    
    
    NSLog(@"------");

    
    return 0;
}
