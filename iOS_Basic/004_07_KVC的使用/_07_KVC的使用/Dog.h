//
//  Dog.h
//  _07_KVC的使用
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

// 姓名
@property (copy, nonatomic)NSString *name;
// 价格
@property (assign, nonatomic)float price;

@end
