//
//  WJZCar.m
//  007_03_UITableView_展示汽车数据(使用模型优化)
//
//  Created by 吴佳臻 on 2018/5/3.
//  Copyright © 2018年 wjz. All rights reserved.
//

#import "WJZCar.h"

@implementation WJZCar

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon{
    WJZCar *car = [[self alloc]init];
    car.name = name;
    car.icon = icon;
    return car;
}

@end
