//
//  WJZCar.m
//  007_04_UITableView_展示汽车数据(复杂的plist解析)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZCar.h"

@implementation WJZCar

+ (instancetype)carWithDict:(NSDictionary *)dict{
    WJZCar *car = [[WJZCar alloc]init];
    car.name = dict[@"name"];
    car.icon = dict[@"icon"];
    return car;
}

@end
