//
//  WJZCarGroup.h
//  007_03_UITableView_展示汽车数据(使用模型优化)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJZCarGroup : NSObject

@property(nonatomic,copy)NSString *header;
@property(nonatomic,copy)NSString *footer;
@property(nonatomic,strong)NSArray *cars;

@end
