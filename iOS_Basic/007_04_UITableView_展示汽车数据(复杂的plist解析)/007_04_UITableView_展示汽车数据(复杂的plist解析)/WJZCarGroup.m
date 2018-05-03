//
//  WJZCarGroup.m
//  007_04_UITableView_展示汽车数据(复杂的plist解析)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZCarGroup.h"
#import "WJZCar.h"
@implementation WJZCarGroup

+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    WJZCarGroup *group = [[self alloc]init];
    group.header = dict[@"header"];
    group.footer = dict[@"footer"];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        WJZCar *car = [WJZCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    return group;
}
@end
