//
//  WJZCarGroup.h
//  007_04_UITableView_展示汽车数据(复杂的plist解析)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZCarGroup : NSObject

@property(nonatomic,copy)NSString *header;
@property(nonatomic,copy)NSString *footer;
@property(nonatomic,strong)NSArray *cars;

+(instancetype)carGroupWithDict:(NSDictionary *)dict;

@end
