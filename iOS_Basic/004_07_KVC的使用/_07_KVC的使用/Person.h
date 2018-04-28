//
//  Person.h
//  _07_KVC的使用
//
//  Created by 吴佳臻 on 2018/1/15.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@interface Person : NSObject
// 姓名
@property (copy, nonatomic)NSString *name;
// 钱
@property (assign, nonatomic)float money;
// 狗
@property (strong, nonatomic)Dog *dog;
// 序号
@property (copy, nonatomic)NSString *no;

- (void)printAge;

- (instancetype)initWithDict: (NSDictionary *)dict;
+ (instancetype)personWithDict: (NSDictionary *)dict;
@end
