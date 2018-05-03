//
//  Person.h
//  _03
//
//  Created by 吴佳臻 on 2017/6/6.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 @public | @private | @protected | @package 就是实例变量修饰符
 
 @public
 >可以在 其它类 中访问被 public修饰的成员变量
 >也可以在 本类 中访问被 public修饰的成员变量
 >可以在 子类 中访问 父类 中被 public修饰的成员变量
 
 @private
 >不可以在 其它类 中访问被 private修饰的成员变量
 >可以在 本类 中访问被 private修饰的成员变量
 >不可以在 子类 中访问 父类 中被private修饰的成员变量
 
 @protected
 >不可以在 其它类 中访问被 protected修饰的成员变量
 >可以在 本类 中访问被 protected修饰的成员变量
 >可以在 子类 中访问 父类 中被protected修饰的成员变量
 
 注意: 默认情况下所有的 实例变量都是 protected
 
 @package
 >介于 @public 和 @private 之间的
 如果是在 其它包 中访问那么就是 @private的
 如果是在 当前代码 所在的 包中 访问就是 @public的
 
 '属性修饰符'作用域: 从出现的位置开始, 一直到下一个修饰符出现
 如果没有遇到下一个实例变量修饰符, 那么就会修饰后面所有的实例变量
 */
@interface Person : NSObject
{
@public
    int _age;
    //
    
@private
    double _height;
    //
    
@protected
    double _weight;
    //
    
    @package
    NSString *_name;
    NSString *_tel;
    NSString *_email;
    
}
  
@end
