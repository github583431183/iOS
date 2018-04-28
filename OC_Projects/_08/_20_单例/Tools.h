//
//  Tools.h
//  _20_单例
//
//  Created by 吴佳臻 on 2017/12/8.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject<NSCopying, NSMutableCopying>
// 一般情况下创建一个单例对象都有一个与之对应的 类方法
// 一般情况下用于创建单例对象的方法名称都以share开头, 或者以default开头
+ (instancetype)shareInstance;
@end
