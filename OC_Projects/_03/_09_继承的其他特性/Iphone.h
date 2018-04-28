//
//  Iphone.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

@interface Iphone : Phone
{
    // 注意: 在继承中方法可以重写, 但是 属性(成员变量) 不能重写
    //    int _cpu;
}

- (void)setCpu:(int)cpu;
- (int)cpu;

/*
 
 方法重写
 如果子类中有和父类同名的方法，则为方法重写
 注意：
 
    继承中的方法调用顺序
        如果自己有就调用自己的，
        如果自己没有就调用父类的
 
    方法的调用顺序
        先自己再父类
        如果父类中没有再爷爷类
        如果爷爷类再没有就找曾祖父类
 
    如果一直找到NSObject类都没找到，那就保存
    reason: '-[Iphone signalWithNumber:]: unrecognized selector sent to instance 0x1003043c0'
 */


// 打电话
- (void)signalWithNumber:(NSString *)number;

// 在继承中除了对象方法可以重写, 类方法也可以重写
+ (void)brand;

@end
