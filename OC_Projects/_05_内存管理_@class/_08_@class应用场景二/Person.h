//
//  Person.h
//  _08_@class应用场景二
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Dog.h"
@class Dog;
/*
 总结:
    如果两个类相互拷贝,
        例如A拷贝B, B拷贝A, 这样会报错
    如何解决:
        在.h中用@class, 在.m中用import
        因为如果.h中都用import, 那么A拷贝B, B又拷贝A, 会形成死循环
        如果在 .h 中用@class, 那么不会做任何拷贝操作,
        而在.m中用 import 只会拷贝对应的文件, 并不会形成死循环
 */
@interface Person : NSObject
@property(nonatomic, retain)Dog *dog;
@end
