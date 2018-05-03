#import <Foundation/Foundation.h>
//#import "StudentProtocol.h"

/*
 协议的编写规范:
    1.一般情况下, 当前 该协议 属于谁, 我们就将 该协议 定义到谁的头文件中
    2.协议的 名称 一般以它属于的那个类的类名开头, 后面跟上protocol或者delegate
    3.协议中的 方法名称 一般以协议的 名称protocol之前 的作为开头
    4.一般情况下协议中的方法会 将触发 该协议的 对象 传递出去
    
    5.一般情况下一个类中的代理属于的名称叫做 delegate
    
    6.当某 一个类 要成为 另外一个类 的代理的时候, 
        一般情况下在 .h 中用@protocol 协议名称;
        告诉当前类 这是一个协议.
        在.m中用#import真正的导入一个协议的声明
 */

@class Person;

// 代理 找房子的 协议，该协议 由对应的房子遵守
@protocol PersonProtocol <NSObject>

- (void)personFindHourse:(Person *)person;

@end

@interface Person : NSObject

// 代理的属性
@property (nonatomic, strong) id<PersonProtocol> delegate;

// 帮学生找房的方法
- (void)findHourse;
@end
