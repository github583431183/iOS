//
//  Person.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    /*
     
     私有变量
     实例变量(成员变量)
     既可以在@interface中定义, 也可以在@implementation中定义

     写在@implementation中的 成员变量, 默认就是 私有 的成员变量,
     
     利用@private修饰的不太一样, 
     在@implementation中定义的 成员变量 在'其它类'中无法查看, 也无法访问
     在@implementation中定义的私有变量只能在本类中访问
     */
    // 私有 无需定义 @public
    double _score;
}

- (void)test
{
    NSLog(@"score = %f", _score);
}
@end

