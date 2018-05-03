//
//  Person.h
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
@public
    int _age;
@protected
    double _height;
@private
    NSString *_name;
    @package
    double _weight;
}

/*
 私有方法
 只有方法的实现, 没有方法的声明
 
 在OC中没有真正的私有方法, 因为OC是消息机制
 - (void)test;
 */
@end
