//
//  Student.m
//  _04
//
//  Created by 吴佳臻 on 2017/6/7.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import "Student.h"

@implementation Student


/**
 多参数构造方法实现，可以调用父类的构造方法，加上自己的实现

 @param age <#age description#>
 @param name <#name description#>
 @param no <#no description#>
 @return <#return value description#>
 */
- (instancetype)initWithAge:(int)age andName:(NSString *)name andNo:(int)no
{
    /*
     if (self = [super init]) {
       _age = age; // 此处拿不到父类的 age属性，因此使用 set 方法
     // 狗拿耗子, 多管闲事
     // 自己的事情自己做
     [self setAge:age];
     [self setName:name];
     }
    */
    
    // 调用父类的双参数构造方法 ，加上 自己的 实现
    if (self = [super initWithAge:age andName:name]) {
        _no = no;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %i, name = %@, no = %i", [self age], [self name], _no];
}
@end
