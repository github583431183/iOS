//
//  Shop.h
//  _03_综合练习
//
//  Created by 吴佳臻 on 2018/1/12.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

// 图片的名称
@property (copy,nonatomic) NSString *icon;
// 商品的名称
@property (copy,nonatomic) NSString *name;

// 提供构造方法
// 对象方法
- (instancetype)initWithIcon:(NSString *)icon name:(NSString *)name;
- (instancetype)initWithDict:(NSDictionary *)dict;
// 类方法
+ (instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name;
+ (instancetype)shopWithIcon:(NSDictionary *)dict;

@end
