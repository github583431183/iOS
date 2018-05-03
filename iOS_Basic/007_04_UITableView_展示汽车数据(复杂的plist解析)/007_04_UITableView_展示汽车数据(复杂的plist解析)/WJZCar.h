//
//  WJZCar.h
//  007_04_UITableView_展示汽车数据(复杂的plist解析)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZCar : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;

+(instancetype)carWithDict:(NSDictionary *)dict;

@end
