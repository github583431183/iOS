//
//  Iphone.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"


/**
 继承的语法
 @interface 类名 : 需要继承的类
 
 其实在类名后面加上 : NSObject ， 就是让当前类继承 NSObject 类
    new 方法就是继承过来的
    isa 指针
 */
@interface Iphone : Phone

-(void)setCpu:(int)cpu;
-(void)cpu;

@end
