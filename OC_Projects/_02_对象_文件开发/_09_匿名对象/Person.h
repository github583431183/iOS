//
//  Person.h
//  _02
//
//  Created by 吴佳臻 on 2017/6/2.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Iphone.h"
@interface Person : NSObject
{
@public
    int _age; // 年龄
    NSString *_name; // 姓名
}

- (void)say;
// 打电话方法
// phone 电话对象, 只有有了电话对象才能打电话
- (void)signal:(Iphone *)phone;


@end
